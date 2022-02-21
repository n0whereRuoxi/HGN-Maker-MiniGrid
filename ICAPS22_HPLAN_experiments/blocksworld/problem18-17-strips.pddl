( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b779 - block
    b327 - block
    b132 - block
    b138 - block
    b707 - block
    b45 - block
    b752 - block
    b152 - block
    b377 - block
    b30 - block
    b150 - block
    b878 - block
    b50 - block
    b839 - block
    b716 - block
    b544 - block
    b695 - block
    b211 - block
    b802 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b779 )
    ( on b327 b779 )
    ( on b132 b327 )
    ( on b138 b132 )
    ( on b707 b138 )
    ( on b45 b707 )
    ( on b752 b45 )
    ( on b152 b752 )
    ( on b377 b152 )
    ( on b30 b377 )
    ( on b150 b30 )
    ( on b878 b150 )
    ( on b50 b878 )
    ( on b839 b50 )
    ( on b716 b839 )
    ( on b544 b716 )
    ( on b695 b544 )
    ( on b211 b695 )
    ( on b802 b211 )
    ( clear b802 )
  )
  ( :goal
    ( and
      ( clear b779 )
    )
  )
)
