//
//  AudiobooksView.swift
//  audiory
//
//  Created by Jan Kožnárek on 13.08.2025.
//
import SwiftUI

struct AudiobooksView: View {
	var body: some View {
		ScrollView {
			let columns = [GridItem(.adaptive(minimum: 160), spacing: 16)]
			LazyVGrid(columns: columns, spacing: 16) {
				ForEach(0 ..< 20, id: \.self) { index in
					NavigationLink {
						PodcastsView()
					} label: {
						AudiobookTile(
							title: "Audiobook \(index + 1)",
							imageURL: URL(string: "https://picsum.photos/seed/\(index)/300/450")
						)
					}
				}
			}
			.padding(16)
		}.toolbar {
			ToolbarItem(placement: .automatic) {
				Button {
					print("Add new audiobook")
				} label: {
					Image(systemName: "plus")
				}
			}
		}
	}
}

#Preview {
	AudiobooksView()
}
