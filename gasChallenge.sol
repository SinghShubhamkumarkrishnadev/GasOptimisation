// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    uint256 constant public MAX_ELEMENTS = 10;
    uint256[MAX_ELEMENTS] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    
    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return 0;
    }
    
    function notOptimizedFunction() public {
        for (uint256 i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    //Implement Remaining Gas Optimization Techniques Here
    //Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
        assembly {
            let len := sload(numbers.slot)
            
            for {let i := 0} lt(i, len) {i := add(i, 1)} {
                sstore(add(numbers.slot, mul(add(i, 1), 0x20)), 0)
            }
        }
    }
}