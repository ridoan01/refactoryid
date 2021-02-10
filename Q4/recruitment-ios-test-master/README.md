# SimpleTodo
#1
**Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'keypath data not found in entity Todo'**
fix : 
let sortDescriptors = NSSortDescriptor(key: "data", ascending: true) change "data" to "date" (TodoTableViewController line 33)

#2
**Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value: file SimpleTodo/AddTodoViewController.swift, line 102**
fix:
connect reference @IBOutlet weak var doneBtn: UIButton! (AddTodoViewController) to addBtn in AddTodoViewControllerscene (storyboard)

#3
**Thread 1: "unable to dequeue a cell with identifier cell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard"**
fix: 
let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  on TodoTableViewController 
typo identifier, change "cell" to "todoCell"


#4
**SimpleTodo[88578:2632704] Could not load the "btnP" image referenced from a nib in the bundle with identifier "com.SimpleTodo"**
fix : Rename image asset 'btnP-1' to 'btnP' update image reference in save buttons to 'btnP'


#5
**Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value: file SimpleTodo/AddNoteViewController.swift, line 27**
fix:
connect reference @IBOutlet weak var noteTextView: UITextView! at AddNoteViewController to note text view AddNoteViewControlerScene  at Storyboard


#6
**Thread 1: "unable to dequeue a cell with identifier cell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard**
fix:
let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) at NoteTableViewController 
typo identifier, change "cell" to "noteCell"

