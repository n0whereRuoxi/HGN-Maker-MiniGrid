( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b439 - block
    b828 - block
    b399 - block
    b453 - block
    b244 - block
    b280 - block
    b733 - block
    b608 - block
    b739 - block
    b116 - block
    b101 - block
    b520 - block
    b212 - block
    b774 - block
    b983 - block
    b846 - block
    b257 - block
    b384 - block
    b327 - block
    b541 - block
    b341 - block
    b169 - block
    b234 - block
    b778 - block
    b197 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b439 )
    ( on b828 b439 )
    ( on b399 b828 )
    ( on b453 b399 )
    ( on b244 b453 )
    ( on b280 b244 )
    ( on b733 b280 )
    ( on b608 b733 )
    ( on b739 b608 )
    ( on b116 b739 )
    ( on b101 b116 )
    ( on b520 b101 )
    ( on b212 b520 )
    ( on b774 b212 )
    ( on b983 b774 )
    ( on b846 b983 )
    ( on b257 b846 )
    ( on b384 b257 )
    ( on b327 b384 )
    ( on b541 b327 )
    ( on b341 b541 )
    ( on b169 b341 )
    ( on b234 b169 )
    ( on b778 b234 )
    ( on b197 b778 )
    ( clear b197 )
  )
  ( :goal
    ( and
      ( clear b439 )
    )
  )
)
