( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b244 - block
    b571 - block
    b11 - block
    b731 - block
    b726 - block
    b127 - block
    b622 - block
    b162 - block
    b795 - block
    b356 - block
    b791 - block
    b116 - block
    b161 - block
    b491 - block
    b150 - block
    b555 - block
    b575 - block
    b401 - block
    b527 - block
    b956 - block
    b353 - block
    b220 - block
    b508 - block
    b237 - block
    b660 - block
    b65 - block
    b264 - block
    b641 - block
    b490 - block
    b627 - block
    b866 - block
    b417 - block
    b107 - block
    b894 - block
    b282 - block
    b886 - block
    b54 - block
    b217 - block
    b758 - block
    b219 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b244 )
    ( on b571 b244 )
    ( on b11 b571 )
    ( on b731 b11 )
    ( on b726 b731 )
    ( on b127 b726 )
    ( on b622 b127 )
    ( on b162 b622 )
    ( on b795 b162 )
    ( on b356 b795 )
    ( on b791 b356 )
    ( on b116 b791 )
    ( on b161 b116 )
    ( on b491 b161 )
    ( on b150 b491 )
    ( on b555 b150 )
    ( on b575 b555 )
    ( on b401 b575 )
    ( on b527 b401 )
    ( on b956 b527 )
    ( on b353 b956 )
    ( on b220 b353 )
    ( on b508 b220 )
    ( on b237 b508 )
    ( on b660 b237 )
    ( on b65 b660 )
    ( on b264 b65 )
    ( on b641 b264 )
    ( on b490 b641 )
    ( on b627 b490 )
    ( on b866 b627 )
    ( on b417 b866 )
    ( on b107 b417 )
    ( on b894 b107 )
    ( on b282 b894 )
    ( on b886 b282 )
    ( on b54 b886 )
    ( on b217 b54 )
    ( on b758 b217 )
    ( on b219 b758 )
    ( clear b219 )
  )
  ( :goal
    ( and
      ( clear b244 )
    )
  )
)
