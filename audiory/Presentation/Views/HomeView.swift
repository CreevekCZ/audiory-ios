import SwiftUI

struct HomeView: View {
	@State private var isPlayerSheetPresented = false

	var body: some View {
		TabView {
			NavigationStack {
				AudiobooksView()
			}.tabItem {
				Image(systemName: "book.fill")
				Text("Audiobooks")
			}

			// NavigationStack {
			// 	PodcastsView()
			// }.tabItem {
			// 	Image(systemName: "dot.radiowaves.left.and.right")
			// 	Text("Podcasts")
			// }

			NavigationStack {
				ContinuePlayingView()
			}.tabItem {
				Image(systemName: "play.circle.fill")
				Text("Continue playing")
			}
		}.toolbar {
			ToolbarItem(placement: .principal) {
				Text("Audiory")
					.font(.largeTitle)
					.bold()
			}
		}
		.tabBarMinimizeBehavior(.onScrollDown)
		.tabViewBottomAccessory(content: {
			CompactPlayerView()
				.onTapGesture {
					isPlayerSheetPresented.toggle()
				}
				.frame(maxWidth: .infinity)
		})
		.sheet(isPresented: $isPlayerSheetPresented, content: {
			PlayerSheetView()
		})
	}
}

#Preview {
	HomeView()
}
