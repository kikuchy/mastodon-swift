import Foundation

func doSync<T>(_ asyncTask: ((T) -> Void) -> Void) -> T {
    let semaphore = DispatchSemaphore(value: 0)
    var returns:T? = nil
    let done: (T) -> Void = { ret in
        returns = ret
        semaphore.signal()
    }
    asyncTask(done)
    semaphore.wait()
    
    return returns!
}
