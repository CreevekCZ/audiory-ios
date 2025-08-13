//
//  Audiobook.swift
//  audiory
//
//  Created by Jan Kožnárek on 13.08.2025.
//
import Foundation
import SwiftData

@Model
class Audiobook: Identifiable {
	var identifier: UUID
	var title: String
	var author: String?
	
	var createdAt: Date
	var updatedAt: Date?
	
	init(
		identifier: UUID = .init(),
		title: String,
		author: String
	) {
		self.identifier = identifier
		self.title = title
		self.author = author
		self.createdAt = Date()
		self.updatedAt = nil
	}
}
