// Purpose: Create and manipulate the reviews collection in the BookHub database.
// The current database to use.
use("BookHub");

// Create collection
db.createCollection("reviews");

// Find all documents in the database.
db.reviews.find();

// Add a document to a collection.
db.reviews.insertOne({
    "book_id": 8,
    "user_id": 5,
    "comment": "Just nice!",
    "rating": 3,
    "timestamp": new ISODate()
});

// Find a document in a collection.
db.reviews.findOne({ "book_id": 7, "user_id": 5 });

// Find documents in a collection by rating.
db.reviews.find({
    "rating": 5
});

// Find documents in a collection by book id.
db.reviews.find({
    "book_id": 1
});

// Find documents in a collection by user id.
db.reviews.find({
    "user_id": 5
});

// Aggregate the average rating of each book and sort by rating.
db.reviews.aggregate(
    [ { $group: { _id: "$book_id", avg_rating: { $avg: "$rating" } } },
    { $sort: { avg_rating: -1 } } ]
);

// Update a document in a collection.
db.reviews.updateOne(
    { _id: ObjectId('67e27498680d6a1ad3627245') },
    { $set: { "rating": 5 } }
);

// Delete a document in a collection.
db.reviews.deleteOne({ _id: ObjectI('67e13b87d6aac1bec678ee31') });
