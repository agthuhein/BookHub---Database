// Purpose: Create a collection to store user activity logs and add documents to it.
// The current database to use.
use("BookHub");

// Create a collection to store user activity logs
db.createCollection("user_activity_logs");

// Find all documents in a collection.
db.user_activity_logs.find();

// Add a document to a collection for USER role
db.user_activity_logs.insertOne({ 
    user_id: 2,
    books: [{ book_id: 7 }, { book_id: 6 }],
    role: 'USER',
    action: 'submit sorder',
    timestamp: ISODate()
});

// Add a document to a collection for ADMIN role
db.user_activity_logs.insertOne({ 
    user_id: 1,
    order_id: 4,
    role: 'ADMIN',
    action: 'update order status to \'confirmed\'',
    timestamp: ISODate()
});

// Find a document in a collection.
db.user_activity_logs.findOne({ "user_id": 5 });

// Find documents in a collection by user role
db.user_activity_logs.find({ "role": "USER" });
db.user_activity_logs.find({ "role": "ADMIN" });
