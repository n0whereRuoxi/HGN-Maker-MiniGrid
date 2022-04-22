( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b42 - block
    b812 - block
    b115 - block
    b314 - block
    b992 - block
    b724 - block
    b682 - block
    b949 - block
    b116 - block
    b508 - block
    b5 - block
    b689 - block
    b48 - block
    b107 - block
    b872 - block
    b360 - block
    b214 - block
    b430 - block
    b563 - block
    b163 - block
    b244 - block
    b775 - block
    b830 - block
    b380 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b42 )
    ( on b812 b42 )
    ( on b115 b812 )
    ( on b314 b115 )
    ( on b992 b314 )
    ( on b724 b992 )
    ( on b682 b724 )
    ( on b949 b682 )
    ( on b116 b949 )
    ( on b508 b116 )
    ( on b5 b508 )
    ( on b689 b5 )
    ( on b48 b689 )
    ( on b107 b48 )
    ( on b872 b107 )
    ( on b360 b872 )
    ( on b214 b360 )
    ( on b430 b214 )
    ( on b563 b430 )
    ( on b163 b563 )
    ( on b244 b163 )
    ( on b775 b244 )
    ( on b830 b775 )
    ( on b380 b830 )
    ( clear b380 )
  )
  ( :goal
    ( and
      ( clear b42 )
    )
  )
)
