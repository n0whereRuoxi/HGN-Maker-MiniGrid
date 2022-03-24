( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b856 - block
    b664 - block
    b992 - block
    b11 - block
    b448 - block
    b162 - block
    b785 - block
    b923 - block
    b451 - block
    b873 - block
    b536 - block
    b264 - block
    b312 - block
    b126 - block
    b10 - block
    b77 - block
    b989 - block
    b883 - block
    b231 - block
    b843 - block
    b119 - block
    b649 - block
    b516 - block
    b399 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b856 )
    ( on b664 b856 )
    ( on b992 b664 )
    ( on b11 b992 )
    ( on b448 b11 )
    ( on b162 b448 )
    ( on b785 b162 )
    ( on b923 b785 )
    ( on b451 b923 )
    ( on b873 b451 )
    ( on b536 b873 )
    ( on b264 b536 )
    ( on b312 b264 )
    ( on b126 b312 )
    ( on b10 b126 )
    ( on b77 b10 )
    ( on b989 b77 )
    ( on b883 b989 )
    ( on b231 b883 )
    ( on b843 b231 )
    ( on b119 b843 )
    ( on b649 b119 )
    ( on b516 b649 )
    ( on b399 b516 )
    ( clear b399 )
  )
  ( :goal
    ( and
      ( clear b856 )
    )
  )
)
