( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b677 - block
    b930 - block
    b176 - block
    b820 - block
    b319 - block
    b900 - block
    b258 - block
    b875 - block
    b769 - block
    b377 - block
    b298 - block
    b66 - block
    b112 - block
    b872 - block
    b528 - block
    b606 - block
    b558 - block
    b259 - block
    b923 - block
    b73 - block
    b436 - block
    b918 - block
    b832 - block
    b826 - block
    b442 - block
    b963 - block
    b548 - block
    b676 - block
    b717 - block
    b172 - block
    b573 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b677 )
    ( on b930 b677 )
    ( on b176 b930 )
    ( on b820 b176 )
    ( on b319 b820 )
    ( on b900 b319 )
    ( on b258 b900 )
    ( on b875 b258 )
    ( on b769 b875 )
    ( on b377 b769 )
    ( on b298 b377 )
    ( on b66 b298 )
    ( on b112 b66 )
    ( on b872 b112 )
    ( on b528 b872 )
    ( on b606 b528 )
    ( on b558 b606 )
    ( on b259 b558 )
    ( on b923 b259 )
    ( on b73 b923 )
    ( on b436 b73 )
    ( on b918 b436 )
    ( on b832 b918 )
    ( on b826 b832 )
    ( on b442 b826 )
    ( on b963 b442 )
    ( on b548 b963 )
    ( on b676 b548 )
    ( on b717 b676 )
    ( on b172 b717 )
    ( on b573 b172 )
    ( clear b573 )
  )
  ( :tasks
    ( Make-30Pile b930 b176 b820 b319 b900 b258 b875 b769 b377 b298 b66 b112 b872 b528 b606 b558 b259 b923 b73 b436 b918 b832 b826 b442 b963 b548 b676 b717 b172 b573 )
  )
)
