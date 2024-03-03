const { addBlog, getBlogs, deleteBlog } = require("./controllers/BlogController");
const userModel = require("./models/User")
const { chat } = require("./controllers/OpenaiController");
const {
  addQuery,
  getQueries,
  deleteQuery,
  replyQuery,
} = require("./controllers/QueryController");

const {registerUser, loginUser, uploadAnalityc} = require("./controllers/UserController")

const router = require("express").Router();

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

// USER ROUTES
router.post("/user", registerUser)
router.post('/user/login', loginUser)
router.post('/user/analityc', uploadAnalityc)

module.exports = router;


