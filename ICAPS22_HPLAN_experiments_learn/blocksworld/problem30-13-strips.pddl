( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b954 - block
    b550 - block
    b753 - block
    b934 - block
    b652 - block
    b943 - block
    b547 - block
    b131 - block
    b569 - block
    b698 - block
    b73 - block
    b279 - block
    b235 - block
    b171 - block
    b167 - block
    b332 - block
    b692 - block
    b571 - block
    b789 - block
    b410 - block
    b515 - block
    b166 - block
    b402 - block
    b672 - block
    b221 - block
    b181 - block
    b768 - block
    b775 - block
    b840 - block
    b559 - block
    b494 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b954 )
    ( on b550 b954 )
    ( on b753 b550 )
    ( on b934 b753 )
    ( on b652 b934 )
    ( on b943 b652 )
    ( on b547 b943 )
    ( on b131 b547 )
    ( on b569 b131 )
    ( on b698 b569 )
    ( on b73 b698 )
    ( on b279 b73 )
    ( on b235 b279 )
    ( on b171 b235 )
    ( on b167 b171 )
    ( on b332 b167 )
    ( on b692 b332 )
    ( on b571 b692 )
    ( on b789 b571 )
    ( on b410 b789 )
    ( on b515 b410 )
    ( on b166 b515 )
    ( on b402 b166 )
    ( on b672 b402 )
    ( on b221 b672 )
    ( on b181 b221 )
    ( on b768 b181 )
    ( on b775 b768 )
    ( on b840 b775 )
    ( on b559 b840 )
    ( on b494 b559 )
    ( clear b494 )
  )
  ( :goal
    ( and
      ( clear b954 )
    )
  )
)
