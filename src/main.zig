const std = @import("std");
const assert = std.debug.assert;

// TODO Remove this workaround
//comptime {
//    const builtin = @import("builtin");
    // if (builtin.os == builtin.Os.macosx) {
    //     @export("__mh_execute_header", _mh_execute_header, builtin.GlobalLinkage.Weak);
    // }
//}
//var _mh_execute_header = extern struct {x: usize}{.x = 0};

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

export fn subtract(a: i32, b: i32) i32 {
    return a - b;
}

export const CounterObserver = extern struct {
    pub context: *c_void,
};

export const CounterState = extern struct {
    pub count: i32,

    export fn init() CounterState {
        return CounterState{
            .count = 0,
        };
    }

    export fn increment(self: *CounterState) void {
        self.count += 1;
    }

    export fn decrement(self: *CounterState) void {
        self.count -= 1;
    }

    export fn subscribe(self: *CounterState, new_subscriber: *CounterObserver) i32 {
        return 0;
    }
};

test "basic add functionality" {
   assert(add(3, 7) == 10);
}

test "basic subtract functionality" {
    assert(subtract(3, 7) == -4);
}

test "test counter state" {
    var counter = CounterState.init();
    assert(counter.count == 0);

    counter.increment();
    counter.increment();
    assert(counter.count == 2);

    counter.decrement();
    assert(counter.count == 1);
}