( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b944 - block
    b232 - block
    b376 - block
    b432 - block
    b371 - block
    b185 - block
    b34 - block
    b839 - block
    b898 - block
    b100 - block
    b553 - block
    b913 - block
    b774 - block
    b45 - block
    b821 - block
    b425 - block
    b591 - block
    b368 - block
    b542 - block
    b383 - block
    b186 - block
    b193 - block
    b388 - block
    b816 - block
    b920 - block
    b571 - block
    b298 - block
    b196 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b944 )
    ( on b232 b944 )
    ( on b376 b232 )
    ( on b432 b376 )
    ( on b371 b432 )
    ( on b185 b371 )
    ( on b34 b185 )
    ( on b839 b34 )
    ( on b898 b839 )
    ( on b100 b898 )
    ( on b553 b100 )
    ( on b913 b553 )
    ( on b774 b913 )
    ( on b45 b774 )
    ( on b821 b45 )
    ( on b425 b821 )
    ( on b591 b425 )
    ( on b368 b591 )
    ( on b542 b368 )
    ( on b383 b542 )
    ( on b186 b383 )
    ( on b193 b186 )
    ( on b388 b193 )
    ( on b816 b388 )
    ( on b920 b816 )
    ( on b571 b920 )
    ( on b298 b571 )
    ( on b196 b298 )
    ( clear b196 )
  )
  ( :goal
    ( and
      ( clear b944 )
    )
  )
)
