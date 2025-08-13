//
//  AudiobookChapter.swift
//  audiory
//
//  Created by Jan Kožnárek on 13.08.2025.
//
import Foundation
import SwiftData

@Model
class AudiobookChapter: Identifiable {
	var identifier: UUID
	var title: String
	var duration: TimeInterval
	var fileURL: URL

	init(identifier: UUID, title: String, duration: TimeInterval, fileURL: URL) {
		self.identifier = identifier
		self.title = title
		self.duration = duration
		self.fileURL = fileURL
	}
}
