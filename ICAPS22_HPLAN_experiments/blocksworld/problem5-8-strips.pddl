( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b326 - block
    b890 - block
    b171 - block
    b785 - block
    b69 - block
    b342 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b326 )
    ( on b890 b326 )
    ( on b171 b890 )
    ( on b785 b171 )
    ( on b69 b785 )
    ( on b342 b69 )
    ( clear b342 )
  )
  ( :goal
    ( and
      ( clear b326 )
    )
  )
)
