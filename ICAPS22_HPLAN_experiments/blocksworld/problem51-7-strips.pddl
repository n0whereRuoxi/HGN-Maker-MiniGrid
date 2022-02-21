( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b227 - block
    b588 - block
    b875 - block
    b107 - block
    b719 - block
    b443 - block
    b663 - block
    b423 - block
    b722 - block
    b641 - block
    b197 - block
    b175 - block
    b222 - block
    b217 - block
    b312 - block
    b23 - block
    b561 - block
    b526 - block
    b853 - block
    b414 - block
    b788 - block
    b518 - block
    b266 - block
    b645 - block
    b292 - block
    b779 - block
    b311 - block
    b768 - block
    b987 - block
    b584 - block
    b504 - block
    b276 - block
    b829 - block
    b20 - block
    b357 - block
    b15 - block
    b128 - block
    b7 - block
    b41 - block
    b730 - block
    b16 - block
    b882 - block
    b531 - block
    b687 - block
    b668 - block
    b186 - block
    b953 - block
    b131 - block
    b373 - block
    b116 - block
    b391 - block
    b840 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b227 )
    ( on b588 b227 )
    ( on b875 b588 )
    ( on b107 b875 )
    ( on b719 b107 )
    ( on b443 b719 )
    ( on b663 b443 )
    ( on b423 b663 )
    ( on b722 b423 )
    ( on b641 b722 )
    ( on b197 b641 )
    ( on b175 b197 )
    ( on b222 b175 )
    ( on b217 b222 )
    ( on b312 b217 )
    ( on b23 b312 )
    ( on b561 b23 )
    ( on b526 b561 )
    ( on b853 b526 )
    ( on b414 b853 )
    ( on b788 b414 )
    ( on b518 b788 )
    ( on b266 b518 )
    ( on b645 b266 )
    ( on b292 b645 )
    ( on b779 b292 )
    ( on b311 b779 )
    ( on b768 b311 )
    ( on b987 b768 )
    ( on b584 b987 )
    ( on b504 b584 )
    ( on b276 b504 )
    ( on b829 b276 )
    ( on b20 b829 )
    ( on b357 b20 )
    ( on b15 b357 )
    ( on b128 b15 )
    ( on b7 b128 )
    ( on b41 b7 )
    ( on b730 b41 )
    ( on b16 b730 )
    ( on b882 b16 )
    ( on b531 b882 )
    ( on b687 b531 )
    ( on b668 b687 )
    ( on b186 b668 )
    ( on b953 b186 )
    ( on b131 b953 )
    ( on b373 b131 )
    ( on b116 b373 )
    ( on b391 b116 )
    ( on b840 b391 )
    ( clear b840 )
  )
  ( :goal
    ( and
      ( clear b227 )
    )
  )
)
