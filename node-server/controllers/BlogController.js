const Blog = require("../models/Blog");

module.exports.addBlog = async (req, res) => {
  const { title, content, author, thumbnail } = req.body;
  try {
    const blog = await Blog.create({ title, content, author, thumbnail });
    await blog.save();
    return res.status(201).json({ success: true, message: "Blog Created" });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

module.exports.getBlogs = async (req, res) => {
  try {
    const blogs = await Blog.find();
    if (!blogs) {
      return res
        .status(404)
        .json({ success: false, message: "No blogs found" });
    }
    return res.status(200).json({ success: true, blogs });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

module.exports.deleteBlog = async (req, res) => {
  const { id } = req.params;

  try {
    const blog = await Blog.findByIdAndDelete(id);
    if (!blog) {
      return res
        .status(404)
        .json({ success: false, message: "Blog not found" });
    }
    return res.status(200).json({ success: true, message: "Blog deleted" });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};
