#!/bin/bash

# Use this script to generate resources files for application
# Swiftgen is installed via CocoaPods. You should not install it manually.

PODS_ROOT=Pods
INPUT_DIR=GitHubClient
OUTPUT_DIR=GitHubClient/SwiftGen

${PODS_ROOT}/SwiftGen/bin/swiftgen storyboards -t swift4 --output ${OUTPUT_DIR}/StoryboardsGen.swift  ${INPUT_DIR}
${PODS_ROOT}/SwiftGen/bin/swiftgen xcassets -t swift4 --output ${OUTPUT_DIR}/ImagesGen.swift  ${INPUT_DIR}/*.xcassets
${PODS_ROOT}/SwiftGen/bin/swiftgen strings -t flat-swift4 --output ${OUTPUT_DIR}/StringsGen.swift  ${INPUT_DIR}/Base.lproj/Localizable.strings
${PODS_ROOT}/SwiftGen/bin/swiftgen colors -t swift4 --output ${OUTPUT_DIR}/ColorsGen.swift  ${INPUT_DIR}/SwiftGen/colors.txt
