fn factorial(n: u32) -> u32 {
    match n {
        0 => 1,
        1 => 1,
        _ => factorial(n - 1) * n,
    }
}
