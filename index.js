const express = require("express");
const mongoose = require("mongoose");
const app = express();
const Products = require("./product"); // Ensure this imports the correct Mongoose model
const User = require("./user"); // Import the User model
const bcrypt = require("bcrypt");

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

// MongoDB connection URI
const uri = "mongodb+srv://.....:......@foodapp.5dgg1.mongodb.net/flutter";

// Connect to MongoDB
mongoose
  .connect(uri)
  .then(() => {
    console.log("MongoDB connected successfully");
  })
  .catch((err) => console.error("MongoDB connection error:", err));

// Listen for connection events
mongoose.connection.on("connected", () => {
  console.log("MongoDB connection established.");
});

mongoose.connection.on("error", (err) => {
  console.error("MongoDB connection error:", err);
});

// POST method to add a product
app.post("/api/add_product", async (req, res) => {
  try {
    const pData = new Products({
      name: req.body.name,
      description: req.body.description,
      price: req.body.price,
    });

    const savedProduct = await pData.save();
    res.status(200).send({
      status_code: 200,
      message: "Product added successfully",
      product: savedProduct,
    });
  } catch (error) {
    res.status(500).send({
      status_code: 500,
      message: "Error adding product",
      error: error.message,
    });
  }
});

// GET method to retrieve products
app.get("/api/get_product", async (req, res) => {
  try {
    const products = await Products.find();
    res.status(200).send({
      status_code: 200,
      products: products,
    });
  } catch (error) {
    res.status(500).send({
      status_code: 500,
      message: "Error retrieving products",
      error: error.message,
    });
  }
});

// PUT method to update a product
// Update product by name
app.put("/api/update_product/:name", async (req, res) => {
  try {
    const updatedProduct = await Products.findOneAndUpdate(
      { name: req.params.name },
      req.body,
      { new: true }
    );
    if (updatedProduct) {
      res.status(200).send({
        status_code: 200,
        message: "Product updated successfully",
        product: updatedProduct,
      });
    } else {
      res.status(404).send({
        status_code: 404,
        message: "Product not found",
      });
    }
  } catch (error) {
    res.status(500).send({
      status_code: 500,
      message: "Error updating product",
      error: error.message,
    });
  }
});

// Delete product by name
app.delete("/api/delete_product/:name", async (req, res) => {
  try {
    const deletedProduct = await Products.findOneAndDelete({
      name: req.params.name,
    });
    if (deletedProduct) {
      res.status(200).send({
        status_code: 200,
        message: "Product deleted successfully",
      });
    } else {
      res.status(404).send({
        status_code: 404,
        message: "Product not found",
      });
    }
  } catch (error) {
    res.status(500).send({
      status_code: 500,
      message: "Error deleting product",
      error: error.message,
    });
  }
});

app.post("/api/register", async (req, res) => {
  try {
    const { email, password } = req.body;

    const userExists = await User.findOne({ email });
    if (userExists) {
      return res.status(400).json({ message: "User already exists" });
    }

    const user = new User({ email, password });
    await user.save();

    res.status(201).json({ message: "User registered successfully" });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error registering user", error: error.message });
  }
});

// Login route
app.post("/api/login", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      return res.status(401).json({ message: "Invalid password" });
    }

    res.status(200).json({ message: "Login successful", userId: user._id });
  } catch (error) {
    res.status(500).json({ message: "Error logging in", error: error.message });
  }
});

// Start the server
app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
