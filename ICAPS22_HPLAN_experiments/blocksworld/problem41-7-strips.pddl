( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b296 - block
    b797 - block
    b757 - block
    b106 - block
    b629 - block
    b55 - block
    b540 - block
    b176 - block
    b85 - block
    b736 - block
    b383 - block
    b545 - block
    b579 - block
    b785 - block
    b379 - block
    b353 - block
    b474 - block
    b419 - block
    b983 - block
    b80 - block
    b180 - block
    b427 - block
    b81 - block
    b73 - block
    b211 - block
    b729 - block
    b582 - block
    b556 - block
    b267 - block
    b225 - block
    b461 - block
    b404 - block
    b219 - block
    b521 - block
    b221 - block
    b480 - block
    b718 - block
    b504 - block
    b781 - block
    b969 - block
    b561 - block
    b320 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b296 )
    ( on b797 b296 )
    ( on b757 b797 )
    ( on b106 b757 )
    ( on b629 b106 )
    ( on b55 b629 )
    ( on b540 b55 )
    ( on b176 b540 )
    ( on b85 b176 )
    ( on b736 b85 )
    ( on b383 b736 )
    ( on b545 b383 )
    ( on b579 b545 )
    ( on b785 b579 )
    ( on b379 b785 )
    ( on b353 b379 )
    ( on b474 b353 )
    ( on b419 b474 )
    ( on b983 b419 )
    ( on b80 b983 )
    ( on b180 b80 )
    ( on b427 b180 )
    ( on b81 b427 )
    ( on b73 b81 )
    ( on b211 b73 )
    ( on b729 b211 )
    ( on b582 b729 )
    ( on b556 b582 )
    ( on b267 b556 )
    ( on b225 b267 )
    ( on b461 b225 )
    ( on b404 b461 )
    ( on b219 b404 )
    ( on b521 b219 )
    ( on b221 b521 )
    ( on b480 b221 )
    ( on b718 b480 )
    ( on b504 b718 )
    ( on b781 b504 )
    ( on b969 b781 )
    ( on b561 b969 )
    ( on b320 b561 )
    ( clear b320 )
  )
  ( :goal
    ( and
      ( clear b296 )
    )
  )
)
