const { addBlog, getBlogs } = require("./controllers/BlogController");
const { chat } = require("./controllers/OpenaiController");

const router = require("express").Router();

router.post("/add-blog", addBlog);
router.get("/get-blogs", getBlogs);
router.post("/chat", chat);

module.exports = router;
