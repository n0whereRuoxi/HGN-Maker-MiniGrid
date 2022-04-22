( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b307 - block
    b543 - block
    b657 - block
    b2 - block
    b485 - block
    b668 - block
    b290 - block
    b90 - block
    b964 - block
    b834 - block
    b59 - block
    b114 - block
    b352 - block
    b32 - block
    b586 - block
    b100 - block
    b132 - block
    b138 - block
    b396 - block
    b179 - block
    b68 - block
    b876 - block
    b433 - block
    b680 - block
    b865 - block
    b505 - block
    b774 - block
    b976 - block
    b788 - block
    b902 - block
    b152 - block
    b350 - block
    b472 - block
    b882 - block
    b868 - block
    b202 - block
    b847 - block
    b382 - block
    b729 - block
    b515 - block
    b365 - block
    b390 - block
    b999 - block
    b501 - block
    b909 - block
    b217 - block
    b900 - block
    b344 - block
    b521 - block
    b675 - block
    b170 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b307 )
    ( on b543 b307 )
    ( on b657 b543 )
    ( on b2 b657 )
    ( on b485 b2 )
    ( on b668 b485 )
    ( on b290 b668 )
    ( on b90 b290 )
    ( on b964 b90 )
    ( on b834 b964 )
    ( on b59 b834 )
    ( on b114 b59 )
    ( on b352 b114 )
    ( on b32 b352 )
    ( on b586 b32 )
    ( on b100 b586 )
    ( on b132 b100 )
    ( on b138 b132 )
    ( on b396 b138 )
    ( on b179 b396 )
    ( on b68 b179 )
    ( on b876 b68 )
    ( on b433 b876 )
    ( on b680 b433 )
    ( on b865 b680 )
    ( on b505 b865 )
    ( on b774 b505 )
    ( on b976 b774 )
    ( on b788 b976 )
    ( on b902 b788 )
    ( on b152 b902 )
    ( on b350 b152 )
    ( on b472 b350 )
    ( on b882 b472 )
    ( on b868 b882 )
    ( on b202 b868 )
    ( on b847 b202 )
    ( on b382 b847 )
    ( on b729 b382 )
    ( on b515 b729 )
    ( on b365 b515 )
    ( on b390 b365 )
    ( on b999 b390 )
    ( on b501 b999 )
    ( on b909 b501 )
    ( on b217 b909 )
    ( on b900 b217 )
    ( on b344 b900 )
    ( on b521 b344 )
    ( on b675 b521 )
    ( on b170 b675 )
    ( clear b170 )
  )
  ( :goal
    ( and
      ( clear b307 )
    )
  )
)
