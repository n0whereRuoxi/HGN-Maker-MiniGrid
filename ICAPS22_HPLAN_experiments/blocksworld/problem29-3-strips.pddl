( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b753 - block
    b719 - block
    b798 - block
    b887 - block
    b261 - block
    b321 - block
    b13 - block
    b494 - block
    b92 - block
    b883 - block
    b249 - block
    b460 - block
    b934 - block
    b201 - block
    b504 - block
    b68 - block
    b81 - block
    b312 - block
    b53 - block
    b625 - block
    b220 - block
    b218 - block
    b334 - block
    b657 - block
    b108 - block
    b341 - block
    b352 - block
    b486 - block
    b868 - block
    b909 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b753 )
    ( on b719 b753 )
    ( on b798 b719 )
    ( on b887 b798 )
    ( on b261 b887 )
    ( on b321 b261 )
    ( on b13 b321 )
    ( on b494 b13 )
    ( on b92 b494 )
    ( on b883 b92 )
    ( on b249 b883 )
    ( on b460 b249 )
    ( on b934 b460 )
    ( on b201 b934 )
    ( on b504 b201 )
    ( on b68 b504 )
    ( on b81 b68 )
    ( on b312 b81 )
    ( on b53 b312 )
    ( on b625 b53 )
    ( on b220 b625 )
    ( on b218 b220 )
    ( on b334 b218 )
    ( on b657 b334 )
    ( on b108 b657 )
    ( on b341 b108 )
    ( on b352 b341 )
    ( on b486 b352 )
    ( on b868 b486 )
    ( on b909 b868 )
    ( clear b909 )
  )
  ( :goal
    ( and
      ( clear b753 )
    )
  )
)
