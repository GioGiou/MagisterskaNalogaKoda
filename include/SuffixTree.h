#include <string>
#include <vector>
#include "Node.h"

using namespace std;

#ifndef SUFFIX_TREE_H
#define SUFFIX_TREE_H
class SuffixTree {
	string text; 
	Node *root; //Pointer to root node

	Node *last_new_node;
	Node *active_node;

	int active_edge;
	int active_length;

	int remaining_suffix_count;
	int leaf_end;
	int *root_end;
	int *split_end;
	int size; //Length of input string
	int size_sub_str;
	vector <int> index_list;
	public: 
		
		SuffixTree(string text);
		SuffixTree(string doc, string query);
		~SuffixTree();
		Node *get_root();
		Node *new_node(int start, int *end);

		int edge_length(Node *n);

		int walk_down(Node *currNode);

		void extend_suffix_tree(int pos);

		void set_suffix_index_by_DFS(Node *n, int labelHeight);

		void free_suffix_tree_by_post_order(Node *n);

		/*Build the suffix tree and print the edge labels along with
		suffix_index. suffix_index for leaf edges will be >= 0 and
		for non-leaf edges will be -1*/
		void build_suffix_tree();
		
		int build_suffix_tree(const char *str, int idx, int start, int end);

		int do_traversal_to_count_leaf(Node *n);

		int count_leaf(Node *n);

		int do_traversal(Node *n, const char* str, int idx);
		int do_traversal(Node *n, int label_height, int* max_height, int* substring_start_index);

		vector <int> check_for_sub_string(const char* str);
		
		vector <int> get_LCS(int *height);
};
#endif