( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b48 - block
    b637 - block
    b212 - block
    b272 - block
    b309 - block
    b924 - block
    b610 - block
    b147 - block
    b941 - block
    b3 - block
    b820 - block
    b432 - block
    b542 - block
    b278 - block
    b502 - block
    b684 - block
    b403 - block
    b667 - block
    b932 - block
    b203 - block
    b352 - block
    b409 - block
    b997 - block
    b69 - block
    b427 - block
    b375 - block
    b177 - block
    b175 - block
    b883 - block
    b817 - block
    b630 - block
    b287 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b48 )
    ( on b637 b48 )
    ( on b212 b637 )
    ( on b272 b212 )
    ( on b309 b272 )
    ( on b924 b309 )
    ( on b610 b924 )
    ( on b147 b610 )
    ( on b941 b147 )
    ( on b3 b941 )
    ( on b820 b3 )
    ( on b432 b820 )
    ( on b542 b432 )
    ( on b278 b542 )
    ( on b502 b278 )
    ( on b684 b502 )
    ( on b403 b684 )
    ( on b667 b403 )
    ( on b932 b667 )
    ( on b203 b932 )
    ( on b352 b203 )
    ( on b409 b352 )
    ( on b997 b409 )
    ( on b69 b997 )
    ( on b427 b69 )
    ( on b375 b427 )
    ( on b177 b375 )
    ( on b175 b177 )
    ( on b883 b175 )
    ( on b817 b883 )
    ( on b630 b817 )
    ( on b287 b630 )
    ( clear b287 )
  )
  ( :goal
    ( and
      ( clear b48 )
    )
  )
)
