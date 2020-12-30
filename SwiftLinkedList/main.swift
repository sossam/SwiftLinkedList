//
//  main.swift
//  SwiftLinkedList
//
//  Created by 김소은 on 2020/12/29.
//  Copyright © 2020 김소은. All rights reserved.
//

import Foundation

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}


class LinkedList<T: Equatable> {
    private var head: Node<T>?
    
    func append(data: T?) {
        
        //head가 없는 경우 Node를 생성 후 head로 지정해준다
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    func insert(data: T?, at index: Int) {
        
        //head가 없는 경우 Node를 생성 후 head로 지정한다
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next == nil { break }
            node = node?.next
        }
        
        let nextNode = node?.next
        node?.next = Node(data: data)
        node?.next?.next = nextNode
        
    }
    
    func remove(at index: Int) {
        
        if head == nil { return }
        
        // head를 삭제하는 경우
        if index == 0 || head?.next == nil {
            head = head?.next
            return
        }
        
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next?.next == nil { break }
            node = node?.next
        }
        
        node?.next = node?.next?.next
        
    }
    
    func removeLast() {
        
        if head == nil { return }
        
        // head를 삭제하는 경우
        if head?.next == nil {
            head = nil
            return
        }
        
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        
        node?.next = node?.next?.next
        
    }
    
    func searchNode(from data: T?) -> Node<T>? {
        
        if head == nil { return nil }
        
        var node = head
        while node?.next != nil {
            if node?.data == data { break; }
            node = node?.next
        }
        
        return node
    }
}


let linkedList = LinkedList<Int>()
linkedList.append(data: 20)
linkedList.append(data: 30)
linkedList.append(data: 40)

