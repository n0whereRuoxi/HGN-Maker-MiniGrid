( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b385 - block
    b410 - block
    b777 - block
    b158 - block
    b466 - block
    b202 - block
    b357 - block
    b383 - block
    b965 - block
    b739 - block
    b250 - block
    b27 - block
    b8 - block
    b572 - block
    b479 - block
    b843 - block
    b268 - block
    b304 - block
    b496 - block
    b508 - block
    b36 - block
    b359 - block
    b280 - block
    b515 - block
    b337 - block
    b705 - block
    b240 - block
    b76 - block
    b293 - block
    b672 - block
    b489 - block
    b689 - block
    b445 - block
    b961 - block
    b520 - block
    b352 - block
    b125 - block
    b339 - block
    b850 - block
    b748 - block
    b258 - block
    b567 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b385 )
    ( on b410 b385 )
    ( on b777 b410 )
    ( on b158 b777 )
    ( on b466 b158 )
    ( on b202 b466 )
    ( on b357 b202 )
    ( on b383 b357 )
    ( on b965 b383 )
    ( on b739 b965 )
    ( on b250 b739 )
    ( on b27 b250 )
    ( on b8 b27 )
    ( on b572 b8 )
    ( on b479 b572 )
    ( on b843 b479 )
    ( on b268 b843 )
    ( on b304 b268 )
    ( on b496 b304 )
    ( on b508 b496 )
    ( on b36 b508 )
    ( on b359 b36 )
    ( on b280 b359 )
    ( on b515 b280 )
    ( on b337 b515 )
    ( on b705 b337 )
    ( on b240 b705 )
    ( on b76 b240 )
    ( on b293 b76 )
    ( on b672 b293 )
    ( on b489 b672 )
    ( on b689 b489 )
    ( on b445 b689 )
    ( on b961 b445 )
    ( on b520 b961 )
    ( on b352 b520 )
    ( on b125 b352 )
    ( on b339 b125 )
    ( on b850 b339 )
    ( on b748 b850 )
    ( on b258 b748 )
    ( on b567 b258 )
    ( clear b567 )
  )
  ( :goal
    ( and
      ( clear b385 )
    )
  )
)
