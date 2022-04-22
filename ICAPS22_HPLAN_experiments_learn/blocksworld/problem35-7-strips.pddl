( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b402 - block
    b693 - block
    b896 - block
    b328 - block
    b390 - block
    b472 - block
    b238 - block
    b943 - block
    b537 - block
    b653 - block
    b840 - block
    b22 - block
    b941 - block
    b868 - block
    b781 - block
    b345 - block
    b544 - block
    b660 - block
    b310 - block
    b164 - block
    b738 - block
    b274 - block
    b504 - block
    b341 - block
    b805 - block
    b400 - block
    b72 - block
    b120 - block
    b605 - block
    b304 - block
    b272 - block
    b934 - block
    b373 - block
    b569 - block
    b985 - block
    b798 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b402 )
    ( on b693 b402 )
    ( on b896 b693 )
    ( on b328 b896 )
    ( on b390 b328 )
    ( on b472 b390 )
    ( on b238 b472 )
    ( on b943 b238 )
    ( on b537 b943 )
    ( on b653 b537 )
    ( on b840 b653 )
    ( on b22 b840 )
    ( on b941 b22 )
    ( on b868 b941 )
    ( on b781 b868 )
    ( on b345 b781 )
    ( on b544 b345 )
    ( on b660 b544 )
    ( on b310 b660 )
    ( on b164 b310 )
    ( on b738 b164 )
    ( on b274 b738 )
    ( on b504 b274 )
    ( on b341 b504 )
    ( on b805 b341 )
    ( on b400 b805 )
    ( on b72 b400 )
    ( on b120 b72 )
    ( on b605 b120 )
    ( on b304 b605 )
    ( on b272 b304 )
    ( on b934 b272 )
    ( on b373 b934 )
    ( on b569 b373 )
    ( on b985 b569 )
    ( on b798 b985 )
    ( clear b798 )
  )
  ( :goal
    ( and
      ( clear b402 )
    )
  )
)
