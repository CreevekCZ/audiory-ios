import SwiftUI

struct AudiobookTile: View {
	let title: String
	let imageURL: URL?

	var body: some View { 
		ZStack(alignment: .bottomLeading) {
			RoundedRectangle(cornerRadius: 8, style: .continuous)
				.fill(Color.gray.opacity(0.2))
			AsyncImage(url: imageURL) { phase in
				switch phase {
				case .empty:
					ProgressView()
						.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
				case .success(let image):
					image
						.resizable()
				case .failure:
					Image(systemName: "book.closed.fill")
						.font(.system(size: 32))
						.foregroundColor(.gray)
						.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
				@unknown default:
					EmptyView()
				}
			}
			LinearGradient(
				colors: [Color.black.opacity(0.0), Color.black.opacity(0.6)],
				startPoint: .top,
				endPoint: .bottom
			)
			.frame(height: 56)
			.frame(maxWidth: .infinity, alignment: .bottom)
			Text(title)
				.font(.headline)
				.foregroundColor(.white)
				.lineLimit(2)
				.padding(8)
		}
		.frame(maxWidth: .infinity)
		.aspectRatio(1, contentMode: .fit)
		.clipped()
		.clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
	}
}

#Preview {
	AudiobookTile(
		title: "Sample Audiobook",
		imageURL: URL(string: "https://picsum.photos/300/300")
	)
}
