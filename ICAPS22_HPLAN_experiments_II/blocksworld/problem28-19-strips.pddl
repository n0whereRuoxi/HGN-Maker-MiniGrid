( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b451 - block
    b484 - block
    b564 - block
    b677 - block
    b192 - block
    b946 - block
    b180 - block
    b19 - block
    b323 - block
    b876 - block
    b805 - block
    b508 - block
    b912 - block
    b174 - block
    b317 - block
    b470 - block
    b898 - block
    b527 - block
    b939 - block
    b161 - block
    b388 - block
    b627 - block
    b230 - block
    b659 - block
    b153 - block
    b110 - block
    b93 - block
    b988 - block
    b487 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b451 )
    ( on b484 b451 )
    ( on b564 b484 )
    ( on b677 b564 )
    ( on b192 b677 )
    ( on b946 b192 )
    ( on b180 b946 )
    ( on b19 b180 )
    ( on b323 b19 )
    ( on b876 b323 )
    ( on b805 b876 )
    ( on b508 b805 )
    ( on b912 b508 )
    ( on b174 b912 )
    ( on b317 b174 )
    ( on b470 b317 )
    ( on b898 b470 )
    ( on b527 b898 )
    ( on b939 b527 )
    ( on b161 b939 )
    ( on b388 b161 )
    ( on b627 b388 )
    ( on b230 b627 )
    ( on b659 b230 )
    ( on b153 b659 )
    ( on b110 b153 )
    ( on b93 b110 )
    ( on b988 b93 )
    ( on b487 b988 )
    ( clear b487 )
  )
  ( :goal
    ( and
      ( clear b451 )
    )
  )
)
