class Solution {
    public List<Integer> majorityElement(int[] nums) {
        int val1 = 0, freq1 = 0;
        int val2 = 0, freq2 = 0; 
        
        for (int num : nums) {
            if (num == val1) {
                freq1++;
            } else if (num == val2) {
                freq2++;
            } 
            else if (freq1 == 0) {
                val1 = num;
                freq1 = 1;
            } else if (freq2 == 0) {
                val2 = num;
                freq2 = 1;
            } 
            else {
                freq1--;
                freq2--;
            }
        }

        // Verification pass 
        freq1 = 0;
        freq2 = 0;
        for (int num : nums) {
            if (num == val1) freq1++;
            else if (num == val2) freq2++;
        }

        List<Integer> res = new ArrayList<>();
        if (freq1 > nums.length / 3) res.add(val1);
        if (freq2 > nums.length / 3) res.add(val2);
        
        return res;
    }
}