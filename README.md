# T Context

[`TContext`](./src/TContext.sol) sets a base transient storage context for
contracts that want to write transient variables at the call context level

inherit `TContext` and use `newContext` modifier to push a new context on each
call to the function

the `context()` function returns the new call context's frame, a keccak hash of
the current context count. this mitigates transient storage collisions
