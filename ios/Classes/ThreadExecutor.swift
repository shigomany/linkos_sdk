
final class ThreadExecutor: Thread {
    var task: () -> Void
    
    let waiter = DispatchGroup()
    
    init(task: @escaping () -> Void) {
        self.task = task
    }

    override func start() {
        waiter.enter()
        super.start()
    }

    override func main() {
        task()
        waiter.leave()
    }

    func join() {
        waiter.wait()
    }
}
