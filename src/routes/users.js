const express = require("express");
const router = express.Router();
const ControllerUsers = require("../controller/users");
const { protect } = require("../middlewares/JWT");
const upload = require("../middlewares/Multer");
// const { validateRegister,
//     validateLogin,
//     validateUpdateProfile,
//     validateChangeEmail,
//     validateChangePassword } = require('../middlewares/common')


const { hitCacheGetProfileUsers , deleteCacheProfileUsers } = require('../middlewares/redis')


router

  .post("/register", ControllerUsers.registerAccount)
  .post("/login", ControllerUsers.loginAccount)
  .post("/refresh-token", ControllerUsers.refreshToken)
  .get("/profile", protect, hitCacheGetProfileUsers , ControllerUsers.profileAccount)
  .put("/profile", protect, deleteCacheProfileUsers , upload.single("picture") , ControllerUsers.profileAccount)
  .delete("/profile", protect, deleteCacheProfileUsers , ControllerUsers.profileAccount)
  .put("/profile/changeEmail", protect, deleteCacheProfileUsers, ControllerUsers.changeEmail)
  .put("/profile/changePassword", protect, deleteCacheProfileUsers , ControllerUsers.changePassword)

  .post("/verify", ControllerUsers.VerifyAccount);


module.exports = router;
