//
//  File.swift
//  
//
//  Created by Fernando Noya on 25/03/2021.
//

import SwiftUI
import Combine
import RxSwift

@available(iOS 13.0, *)
public struct libraryStories: View {
    
private var images: [String]
private var width: CGFloat
private var position: Int

    public init(images: [String], width: CGFloat, position: Int) {
        self.images = images
        self.width = width
        self.position = position
}

    public var body: some View {
        Image(self.images[self.position])
        .resizable()
        .edgesIgnoringSafeArea(.all)
        .scaledToFill()
            .frame(width: self.width, height: nil, alignment: .center)
        .animation(.none)
    }
    
}

public class StoriesService {
    var subject: PublishSubject<Bool>? = nil

    public func start() {
        self.subject = PublishSubject<Bool>()
        self.subject?.onNext(true)
    }
    
    public func goBack() {
        self.subject?.onNext(false)
        self.subject?.dispose()
    }
    
  static let sharedInstance : StoriesService = StoriesService()

}

//componente de imagenes fullscreen

// barritas de progreso

@available(iOS 13.0, *)
public struct ProgressView: View {
    var progress: CGFloat
    
    public init(progress: CGFloat) {
        self.progress = progress
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.3))
                    .cornerRadius(5)

                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: nil, alignment: .leading)
                    .foregroundColor(Color.white.opacity(0.9))
                    .cornerRadius(5)
            }
        }
    }}


// tiempo de animacion clase

@available(iOS 13.0, *)
public class StoryTimer: ObservableObject {
    
    @Published var progress: Double
    
    private var interval: TimeInterval
    private var max: Int
    private var publisher: Timer.TimerPublisher
    private var cancellable: Cancellable?
    var service: StoriesService
    init(items: Int, interval: TimeInterval) {
        self.max = items
        self.progress = 0
        self.interval = interval
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
        self.service = StoriesService.sharedInstance
    }
    
    func start() {
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
        self.cancellable = self.publisher.autoconnect().sink(receiveValue: {  _ in
            var newProgress = self.progress + (0.1 / self.interval)
            if (Int(newProgress) >= self.max) {
                self.service.goBack()
                newProgress = 0
            }
            self.progress = newProgress
        })
    }
    
    func cancel() {
        self.progress = 0
        self.cancellable?.cancel()
    }
    
    func advance(by number: Int) {
        var newProgress = (Int(self.progress) + number)
        if (Int(newProgress) >= self.max || Int(newProgress) < 0) {
            self.service.goBack()
            newProgress = 0
        }
        self.progress = Double(newProgress)
    }
}
