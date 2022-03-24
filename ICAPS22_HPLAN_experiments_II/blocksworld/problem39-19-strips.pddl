( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b493 - block
    b260 - block
    b734 - block
    b252 - block
    b461 - block
    b970 - block
    b876 - block
    b188 - block
    b25 - block
    b355 - block
    b353 - block
    b149 - block
    b320 - block
    b719 - block
    b750 - block
    b187 - block
    b139 - block
    b523 - block
    b859 - block
    b176 - block
    b673 - block
    b178 - block
    b11 - block
    b409 - block
    b261 - block
    b951 - block
    b45 - block
    b8 - block
    b764 - block
    b508 - block
    b322 - block
    b908 - block
    b911 - block
    b428 - block
    b806 - block
    b778 - block
    b550 - block
    b486 - block
    b682 - block
    b698 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b493 )
    ( on b260 b493 )
    ( on b734 b260 )
    ( on b252 b734 )
    ( on b461 b252 )
    ( on b970 b461 )
    ( on b876 b970 )
    ( on b188 b876 )
    ( on b25 b188 )
    ( on b355 b25 )
    ( on b353 b355 )
    ( on b149 b353 )
    ( on b320 b149 )
    ( on b719 b320 )
    ( on b750 b719 )
    ( on b187 b750 )
    ( on b139 b187 )
    ( on b523 b139 )
    ( on b859 b523 )
    ( on b176 b859 )
    ( on b673 b176 )
    ( on b178 b673 )
    ( on b11 b178 )
    ( on b409 b11 )
    ( on b261 b409 )
    ( on b951 b261 )
    ( on b45 b951 )
    ( on b8 b45 )
    ( on b764 b8 )
    ( on b508 b764 )
    ( on b322 b508 )
    ( on b908 b322 )
    ( on b911 b908 )
    ( on b428 b911 )
    ( on b806 b428 )
    ( on b778 b806 )
    ( on b550 b778 )
    ( on b486 b550 )
    ( on b682 b486 )
    ( on b698 b682 )
    ( clear b698 )
  )
  ( :goal
    ( and
      ( clear b493 )
    )
  )
)
