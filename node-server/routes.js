const {
  addBlog,
  getBlogs,
  deleteBlog,
} = require("./controllers/BlogController");
const { chat } = require("./controllers/OpenaiController");
const {
  addQuery,
  getQueries,
  deleteQuery,
  replyQuery,
} = require("./controllers/QueryController");

const router = require("express").Router();

// BLOG ROUTES
router.post("/add-blog", addBlog);
router.get("/get-blogs", getBlogs);
router.delete("/delete-blog/:id", deleteBlog);

// CHAT ROUTE
router.post("/chat", chat);

// QUERY ROUTES
router.post("/add-query", addQuery);
router.get("/get-queries", getQueries);
router.delete("/delete-query/:id", deleteQuery);
router.put("/reply-query/:id", replyQuery);

module.exports = router;
