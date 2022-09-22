package com.learn.basic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;

public class DataStructureTypes {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Learn about Data structure");
		/// Array and array List
		int pathik_array[] = new int[10];
		pathik_array[0] = 25;
		System.out.println(pathik_array[0]);
		
		int[] differentway = new int[10];
		differentway[0] = 50;
		System.out.println(differentway[0]);
		// Array is fixed size and it's continue blocks
		
		//// Now Array List , it's dynamic 
		ArrayList<String> arraylist_veriable = new ArrayList<String>();
		arraylist_veriable.add("test");
		arraylist_veriable.add("test1");
		System.out.println(arraylist_veriable); //[test, test1]
		System.out.println(arraylist_veriable.get(0)); //test
		
		//List is interface vs ArrayList is class 
		
		//Array list vs linkedList
		LinkedList<String> link_list_veriable = new LinkedList<String>();
		link_list_veriable.add("linked ist");
		link_list_veriable.add("linked List 2");
		System.out.println(link_list_veriable);
		// Different between Array list and linked list
		/* Both Imllement list interface but arraylist add the object by shifting where link list has object and it
		 * it's pointer and it will connect to each other with that pointer
		 * user array list for storing 
		 * use Linkedlist for manipulation
		 * 
		 * 
		 */
		// Hash map : it's map with key and pair
		HashMap<Integer, String> hashmap_veriable = new HashMap<Integer, String>();
		
		hashmap_veriable.put(1, "pathik");
		hashmap_veriable.put(1, "shah");
		System.out.println(hashmap_veriable);//{1=shah}
		//Hash map can take duplicate 
		// few methods remove() .clear()
		
		//Hash Set same as hash map but it dont allow duplicates
		HashSet<String> hashset_variable = new HashSet<String>();
		hashset_variable.add("First");
		hashset_variable.add("Second");
		System.out.println(hashset_variable);//[Second, First]
		hashset_variable.add("Second");
		
		System.out.println(hashset_variable);//[Second, First]
		
		// so basically set and list is interface and otehr are implemettation of that interface
		/*hashset is implementation of set and it can not take duplicates , it uses some hash value to insert
		 * that why it can not gurantee insertion order 
		 * where linkedhashset used linked list concept so one can predict insertion order.
		 * 
		 * 
		 */
		LinkedHashSet<String> lnk_hash_set = new LinkedHashSet<String>();
		/*
		 * HashSet is an unordered & unsorted collection of the data set, whereas the LinkedHashSet is an ordered and sorted collection of HashSet.
		HashSet does not provide any method to maintain the insertion order. Comparatively, LinkedHashSet maintains the insertion order of the elements.
		 */
		
		//Map vs Set 
		/*
		 * both are interface and map takes the key and valuue and insert it but it can have duplicate if j
		 * key is different where set can not have duplocate
		 */
		HashMap<Integer, String> hashmap_variable = new HashMap<Integer, String>();
		hashmap_variable.put(1, "Pathik");
		hashmap_variable.put(2, "Pathik");
		System.out.println(hashmap_variable);
		
		
		
		
		
		
		

	}

}
