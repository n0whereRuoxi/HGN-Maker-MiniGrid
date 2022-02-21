( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b600 - block
    b862 - block
    b368 - block
    b88 - block
    b882 - block
    b231 - block
    b696 - block
    b147 - block
    b10 - block
    b875 - block
    b753 - block
    b161 - block
    b505 - block
    b657 - block
    b863 - block
    b957 - block
    b508 - block
    b564 - block
    b764 - block
    b551 - block
    b307 - block
    b264 - block
    b418 - block
    b148 - block
    b252 - block
    b94 - block
    b82 - block
    b286 - block
    b135 - block
    b245 - block
    b727 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b600 )
    ( on b862 b600 )
    ( on b368 b862 )
    ( on b88 b368 )
    ( on b882 b88 )
    ( on b231 b882 )
    ( on b696 b231 )
    ( on b147 b696 )
    ( on b10 b147 )
    ( on b875 b10 )
    ( on b753 b875 )
    ( on b161 b753 )
    ( on b505 b161 )
    ( on b657 b505 )
    ( on b863 b657 )
    ( on b957 b863 )
    ( on b508 b957 )
    ( on b564 b508 )
    ( on b764 b564 )
    ( on b551 b764 )
    ( on b307 b551 )
    ( on b264 b307 )
    ( on b418 b264 )
    ( on b148 b418 )
    ( on b252 b148 )
    ( on b94 b252 )
    ( on b82 b94 )
    ( on b286 b82 )
    ( on b135 b286 )
    ( on b245 b135 )
    ( on b727 b245 )
    ( clear b727 )
  )
  ( :goal
    ( and
      ( clear b600 )
    )
  )
)
