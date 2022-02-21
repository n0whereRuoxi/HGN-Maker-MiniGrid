( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b293 - block
    b385 - block
    b150 - block
    b345 - block
    b514 - block
    b290 - block
    b981 - block
    b692 - block
    b235 - block
    b773 - block
    b391 - block
    b815 - block
    b929 - block
    b828 - block
    b916 - block
    b984 - block
    b98 - block
    b535 - block
    b594 - block
    b316 - block
    b703 - block
    b137 - block
    b464 - block
    b105 - block
    b115 - block
    b880 - block
    b962 - block
    b683 - block
    b949 - block
    b662 - block
    b130 - block
    b778 - block
    b688 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b293 )
    ( on b385 b293 )
    ( on b150 b385 )
    ( on b345 b150 )
    ( on b514 b345 )
    ( on b290 b514 )
    ( on b981 b290 )
    ( on b692 b981 )
    ( on b235 b692 )
    ( on b773 b235 )
    ( on b391 b773 )
    ( on b815 b391 )
    ( on b929 b815 )
    ( on b828 b929 )
    ( on b916 b828 )
    ( on b984 b916 )
    ( on b98 b984 )
    ( on b535 b98 )
    ( on b594 b535 )
    ( on b316 b594 )
    ( on b703 b316 )
    ( on b137 b703 )
    ( on b464 b137 )
    ( on b105 b464 )
    ( on b115 b105 )
    ( on b880 b115 )
    ( on b962 b880 )
    ( on b683 b962 )
    ( on b949 b683 )
    ( on b662 b949 )
    ( on b130 b662 )
    ( on b778 b130 )
    ( on b688 b778 )
    ( clear b688 )
  )
  ( :goal
    ( and
      ( clear b293 )
    )
  )
)
