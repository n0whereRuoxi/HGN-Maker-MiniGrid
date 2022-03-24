( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b856 - block
    b653 - block
    b773 - block
    b832 - block
    b115 - block
    b949 - block
    b810 - block
    b8 - block
    b611 - block
    b946 - block
    b903 - block
    b750 - block
    b214 - block
    b710 - block
    b993 - block
    b768 - block
    b11 - block
    b498 - block
    b850 - block
    b235 - block
    b530 - block
    b192 - block
    b308 - block
    b496 - block
    b619 - block
    b120 - block
    b867 - block
    b285 - block
    b758 - block
    b560 - block
    b602 - block
    b858 - block
    b455 - block
    b479 - block
    b423 - block
    b725 - block
    b490 - block
    b357 - block
    b505 - block
    b815 - block
    b463 - block
    b506 - block
    b787 - block
    b221 - block
    b883 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b856 )
    ( on b653 b856 )
    ( on b773 b653 )
    ( on b832 b773 )
    ( on b115 b832 )
    ( on b949 b115 )
    ( on b810 b949 )
    ( on b8 b810 )
    ( on b611 b8 )
    ( on b946 b611 )
    ( on b903 b946 )
    ( on b750 b903 )
    ( on b214 b750 )
    ( on b710 b214 )
    ( on b993 b710 )
    ( on b768 b993 )
    ( on b11 b768 )
    ( on b498 b11 )
    ( on b850 b498 )
    ( on b235 b850 )
    ( on b530 b235 )
    ( on b192 b530 )
    ( on b308 b192 )
    ( on b496 b308 )
    ( on b619 b496 )
    ( on b120 b619 )
    ( on b867 b120 )
    ( on b285 b867 )
    ( on b758 b285 )
    ( on b560 b758 )
    ( on b602 b560 )
    ( on b858 b602 )
    ( on b455 b858 )
    ( on b479 b455 )
    ( on b423 b479 )
    ( on b725 b423 )
    ( on b490 b725 )
    ( on b357 b490 )
    ( on b505 b357 )
    ( on b815 b505 )
    ( on b463 b815 )
    ( on b506 b463 )
    ( on b787 b506 )
    ( on b221 b787 )
    ( on b883 b221 )
    ( clear b883 )
  )
  ( :tasks
    ( Make-44Pile b653 b773 b832 b115 b949 b810 b8 b611 b946 b903 b750 b214 b710 b993 b768 b11 b498 b850 b235 b530 b192 b308 b496 b619 b120 b867 b285 b758 b560 b602 b858 b455 b479 b423 b725 b490 b357 b505 b815 b463 b506 b787 b221 b883 )
  )
)
