module wisp::swap_pool {
    use sui::object::{UID};
    use sui::object_bag::{ObjectBag};
    struct Setting has key {
        id: UID,
        fee_to: address,
        pools: ObjectBag
    }
}