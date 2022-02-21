( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b982 - block
    b450 - block
    b238 - block
    b91 - block
    b133 - block
    b341 - block
    b765 - block
    b498 - block
    b880 - block
    b743 - block
    b192 - block
    b314 - block
    b789 - block
    b351 - block
    b356 - block
    b755 - block
    b579 - block
    b444 - block
    b84 - block
    b990 - block
    b791 - block
    b434 - block
    b243 - block
    b888 - block
    b564 - block
    b273 - block
    b535 - block
    b662 - block
    b701 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b982 )
    ( on b450 b982 )
    ( on b238 b450 )
    ( on b91 b238 )
    ( on b133 b91 )
    ( on b341 b133 )
    ( on b765 b341 )
    ( on b498 b765 )
    ( on b880 b498 )
    ( on b743 b880 )
    ( on b192 b743 )
    ( on b314 b192 )
    ( on b789 b314 )
    ( on b351 b789 )
    ( on b356 b351 )
    ( on b755 b356 )
    ( on b579 b755 )
    ( on b444 b579 )
    ( on b84 b444 )
    ( on b990 b84 )
    ( on b791 b990 )
    ( on b434 b791 )
    ( on b243 b434 )
    ( on b888 b243 )
    ( on b564 b888 )
    ( on b273 b564 )
    ( on b535 b273 )
    ( on b662 b535 )
    ( on b701 b662 )
    ( clear b701 )
  )
  ( :goal
    ( and
      ( clear b982 )
    )
  )
)
