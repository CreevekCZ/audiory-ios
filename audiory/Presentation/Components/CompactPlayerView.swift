import SwiftUI

struct CompactPlayerView: View {
	@State private var isPlaying = false

	var body: some View {
		HStack(spacing: 12) {
			AsyncImage(url: URL(string: "https://picsum.photos/300/300")) { phase in
				switch phase {
				case .empty:
					ProgressView()
				case .success(let image):
					image
						.resizable()
						.scaledToFill()
				case .failure:
					Image(systemName: "book.closed.fill")
						.resizable()
						.scaledToFit()
						.foregroundColor(.gray)
						.padding(6)
				@unknown default:
					EmptyView()
				}
			}
			.frame(width: 40, height: 40)
			.clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

			VStack(alignment: .leading, spacing: 2) {
				Text("Audiobook 1")
					.font(.headline)
					.foregroundColor(.primary)
					.lineLimit(1)
				Text("DVTV Premium")
					.font(.subheadline)
					.foregroundColor(.secondary)
					.lineLimit(1)
			}


			Spacer()


			HStack(spacing: 16) {
				Button {
					isPlaying.toggle()
				} label: {
					Image(systemName: isPlaying ? "pause.fill" : "play.fill")
						.font(.title2)
				}

				Button {
					print("Jump forward 30s")
				} label: {
					Image(systemName: "goforward.30")
						.font(.title2)
				}
			}
			.padding(.trailing, 16)
			.buttonStyle(.borderless)
			.foregroundColor(.primary)
		}
		.frame(maxWidth: .infinity)
		.padding(.horizontal)
	}
}

#Preview {
	CompactPlayerView()
		.frame(height: 60)
		.background(Color(.systemGray6))
}
