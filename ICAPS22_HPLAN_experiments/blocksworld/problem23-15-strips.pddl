( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b820 - block
    b623 - block
    b442 - block
    b373 - block
    b659 - block
    b584 - block
    b345 - block
    b950 - block
    b998 - block
    b384 - block
    b431 - block
    b33 - block
    b730 - block
    b601 - block
    b207 - block
    b140 - block
    b84 - block
    b578 - block
    b454 - block
    b212 - block
    b925 - block
    b737 - block
    b992 - block
    b351 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b820 )
    ( on b623 b820 )
    ( on b442 b623 )
    ( on b373 b442 )
    ( on b659 b373 )
    ( on b584 b659 )
    ( on b345 b584 )
    ( on b950 b345 )
    ( on b998 b950 )
    ( on b384 b998 )
    ( on b431 b384 )
    ( on b33 b431 )
    ( on b730 b33 )
    ( on b601 b730 )
    ( on b207 b601 )
    ( on b140 b207 )
    ( on b84 b140 )
    ( on b578 b84 )
    ( on b454 b578 )
    ( on b212 b454 )
    ( on b925 b212 )
    ( on b737 b925 )
    ( on b992 b737 )
    ( on b351 b992 )
    ( clear b351 )
  )
  ( :goal
    ( and
      ( clear b820 )
    )
  )
)
