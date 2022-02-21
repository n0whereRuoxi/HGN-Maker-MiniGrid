( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b225 - block
    b246 - block
    b349 - block
    b695 - block
    b552 - block
    b163 - block
    b66 - block
    b755 - block
    b210 - block
    b919 - block
    b277 - block
    b693 - block
    b732 - block
    b771 - block
    b765 - block
    b119 - block
    b681 - block
    b399 - block
    b888 - block
    b686 - block
    b651 - block
    b568 - block
    b668 - block
    b499 - block
    b102 - block
    b920 - block
    b606 - block
    b218 - block
    b846 - block
    b15 - block
    b263 - block
    b338 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b225 )
    ( on b246 b225 )
    ( on b349 b246 )
    ( on b695 b349 )
    ( on b552 b695 )
    ( on b163 b552 )
    ( on b66 b163 )
    ( on b755 b66 )
    ( on b210 b755 )
    ( on b919 b210 )
    ( on b277 b919 )
    ( on b693 b277 )
    ( on b732 b693 )
    ( on b771 b732 )
    ( on b765 b771 )
    ( on b119 b765 )
    ( on b681 b119 )
    ( on b399 b681 )
    ( on b888 b399 )
    ( on b686 b888 )
    ( on b651 b686 )
    ( on b568 b651 )
    ( on b668 b568 )
    ( on b499 b668 )
    ( on b102 b499 )
    ( on b920 b102 )
    ( on b606 b920 )
    ( on b218 b606 )
    ( on b846 b218 )
    ( on b15 b846 )
    ( on b263 b15 )
    ( on b338 b263 )
    ( clear b338 )
  )
  ( :goal
    ( and
      ( clear b225 )
    )
  )
)
