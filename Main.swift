
//
//  MyStack.swift
//
//  This class is a 'blueprint' for a stack
//
//
//  Created by Heejo Suh in Mar 2018
//  Copyright @ 2018 MTHS. All rights reserved.
//
//			swiftc MyStack.swift


//------------------------------------------------
class MyStack<assignType>{
	//This class defines the stack
	
	//create private list
	private var list = [assignType]()

	
	//-----------------------		
	enum NewError : Error {
	//create error enum
    	case IndexOutOfRange(String)
	}
	
	//-----------------------
	public func str() -> String {
		//returns list as a string
		return "\(list)"
	}
	
	//-----------------------
	public func clear() -> String {
		//clears whole list
		list = []
		return "\(list)"
	}
	
	//-----------------------
	//use "try" to use these "throw" functionss
	public func peek() throws -> assignType {
		//returns item at the top stack without removing it
		if list.count == 0 {
			throw NewError.IndexOutOfRange("ERROR: no list!")
		}
		return list[list.count - 1]
	}

	//-----------------------	
	public func at(index: Int) -> assignType{
		//returns the item at input index
		return list[index]
	}

	//-----------------------		
	public func pop() throws -> assignType {
		//pops the last value from the stack and returns it
		if list.count == 0 {
			throw NewError.IndexOutOfRange("ERROR: no list!")
		}
		
		let value: assignType = list[list.count - 1]
		list.removeLast()
		return value
	}

	//-----------------------
	public func push(value: assignType) {
		//append an object to the end of the stack
		list.append(value)
	}
}

//------------------------------------------------
//------------------------------------------------
//------------------------------------------------


//
//  Main.swift
//
//   This program uses the stack 'MyStack'
//
//
//  Created by Heejo Suh in Mar 2018
//  Copyright @ 2018 MTHS. All rights reserved.
//
//			swiftc Main.swift


//------------------------------------------------

//import Foundation

var inputNumber : Int?

//get integer input
while true {
	print("Try a number: ")
	
	let input: String? = readLine(strippingNewline: true)
	
	if Int(input!) != nil {
		inputNumber = Int(input!)
		break;
	} else {
		print("Insert an integer!")
	}
}
		
//---------------------
//instantiate stack		
var stackObject = MyStack<Int>() //use <> to define type!

//push to list		
stackObject.push(value: inputNumber!)
stackObject.push(value: inputNumber!)
stackObject.push(value: inputNumber!)
print("Pushed \(stackObject.at(index: 0))")
print("List: \(stackObject.str())")

//pop from list
print("Popped \(try stackObject.pop())")
print("List: \(stackObject.str())")

//peek last value
print("Peek \(try stackObject.peek())")

//clear list
print("Cleared list \(stackObject.clear())")

//pop error
print("Pop error \(try stackObject.pop())")

