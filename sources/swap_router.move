module wisp::farm_pool {
    use wisp::swap_pool::{Setting};
    use sui::pay;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin};

    public entry fun add_liquidity_<F, S>(
        setting: &mut Setting, 
        first_tokens: vector<Coin<F>>,
        second_tokens: vector<Coin<S>>, 
        amount_first_desired: u64, 
        amount_second_desired: u64, 
        amount_first_min: u64, 
        amount_second_min: u64, 
        ctx: &mut TxContext
    ) {
        let first_token: Coin<F> = coin::zero<F>(ctx);
        let second_token: Coin<S> = coin::zero<S>(ctx);
        pay::join_vec<F>(&mut first_token, first_tokens);
        pay::join_vec<S>(&mut second_token, second_tokens);
        
        transfer::transfer(first_token, tx_context::sender(ctx)); 
        transfer::transfer(second_token, tx_context::sender(ctx)); 
    }
}