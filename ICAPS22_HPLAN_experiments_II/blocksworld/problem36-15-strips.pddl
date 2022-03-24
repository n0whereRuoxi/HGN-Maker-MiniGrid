( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b102 - block
    b913 - block
    b399 - block
    b389 - block
    b904 - block
    b500 - block
    b259 - block
    b487 - block
    b313 - block
    b63 - block
    b194 - block
    b326 - block
    b541 - block
    b61 - block
    b782 - block
    b459 - block
    b557 - block
    b876 - block
    b138 - block
    b980 - block
    b781 - block
    b543 - block
    b828 - block
    b82 - block
    b848 - block
    b192 - block
    b858 - block
    b297 - block
    b406 - block
    b338 - block
    b725 - block
    b18 - block
    b166 - block
    b467 - block
    b719 - block
    b928 - block
    b325 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b102 )
    ( on b913 b102 )
    ( on b399 b913 )
    ( on b389 b399 )
    ( on b904 b389 )
    ( on b500 b904 )
    ( on b259 b500 )
    ( on b487 b259 )
    ( on b313 b487 )
    ( on b63 b313 )
    ( on b194 b63 )
    ( on b326 b194 )
    ( on b541 b326 )
    ( on b61 b541 )
    ( on b782 b61 )
    ( on b459 b782 )
    ( on b557 b459 )
    ( on b876 b557 )
    ( on b138 b876 )
    ( on b980 b138 )
    ( on b781 b980 )
    ( on b543 b781 )
    ( on b828 b543 )
    ( on b82 b828 )
    ( on b848 b82 )
    ( on b192 b848 )
    ( on b858 b192 )
    ( on b297 b858 )
    ( on b406 b297 )
    ( on b338 b406 )
    ( on b725 b338 )
    ( on b18 b725 )
    ( on b166 b18 )
    ( on b467 b166 )
    ( on b719 b467 )
    ( on b928 b719 )
    ( on b325 b928 )
    ( clear b325 )
  )
  ( :goal
    ( and
      ( clear b102 )
    )
  )
)
