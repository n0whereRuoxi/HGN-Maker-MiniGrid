( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b114 - block
    b750 - block
    b790 - block
    b334 - block
    b861 - block
    b132 - block
    b795 - block
    b200 - block
    b843 - block
    b543 - block
    b14 - block
    b757 - block
    b545 - block
    b779 - block
    b707 - block
    b455 - block
    b214 - block
    b495 - block
    b546 - block
    b242 - block
    b116 - block
    b975 - block
    b247 - block
    b131 - block
    b616 - block
    b990 - block
    b966 - block
    b572 - block
    b521 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b114 )
    ( on b750 b114 )
    ( on b790 b750 )
    ( on b334 b790 )
    ( on b861 b334 )
    ( on b132 b861 )
    ( on b795 b132 )
    ( on b200 b795 )
    ( on b843 b200 )
    ( on b543 b843 )
    ( on b14 b543 )
    ( on b757 b14 )
    ( on b545 b757 )
    ( on b779 b545 )
    ( on b707 b779 )
    ( on b455 b707 )
    ( on b214 b455 )
    ( on b495 b214 )
    ( on b546 b495 )
    ( on b242 b546 )
    ( on b116 b242 )
    ( on b975 b116 )
    ( on b247 b975 )
    ( on b131 b247 )
    ( on b616 b131 )
    ( on b990 b616 )
    ( on b966 b990 )
    ( on b572 b966 )
    ( on b521 b572 )
    ( clear b521 )
  )
  ( :goal
    ( and
      ( clear b114 )
    )
  )
)
