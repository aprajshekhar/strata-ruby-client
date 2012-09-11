require 'xsd/mapping'
require_relative 'client/model/strata.rb'

module Client; module Model

module ClientModelStrataMappingRegistry
  NsStrata = "http://www.redhat.com/gss/strata"
  Registry = ::SOAP::Mapping::LiteralRegistry.new

  Registry.register(
    :class => Client::Model::Base_link,
    :schema_type => XSD::QName.new(NsStrata, "base_link"),
    :schema_basetype => XSD::QName.new(NsStrata, "strataEntity"),
    :schema_element => [
      ["value", "SOAP::SOAPString", [0, 1]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "title") => "SOAP::SOAPString",
      XSD::QName.new(nil, "rel") => "SOAP::SOAPString",
      XSD::QName.new(nil, "href") => "SOAP::SOAPString",
      XSD::QName.new(nil, "type") => "SOAP::SOAPString",
      XSD::QName.new(nil, "uri") => "SOAP::SOAPString"
    }
  )

  Registry.register(
    :class => Client::Model::Problems,
    :schema_name => XSD::QName.new(NsStrata, "problems"),
    :schema_element => [ :choice,
      ["source", "SOAP::SOAPString[]", [0, 1]],
      ["link", "Client::Model::Link[]"],
      ["problem", "Client::Model::Problem[]"]
    ]
  )

  Registry.register(
    :class => Client::Model::Problem,
    :schema_name => XSD::QName.new(NsStrata, "problem"),
    :schema_element => [ :choice,
      ["source", "SOAP::SOAPString[]", [0, 1]],
      ["link", "Client::Model::Link[]"]
    ]
  )

  Registry.register(
    :class => Client::Model::Solutions,
    :schema_name => XSD::QName.new(NsStrata, "solutions"),
    :schema_element => [
      ["solution", "Client::Model::Solution[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::Articles,
    :schema_name => XSD::QName.new(NsStrata, "articles"),
    :schema_element => [
      ["article", "Client::Model::Article[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::SqiRating,
    :schema_name => XSD::QName.new(NsStrata, "sqiRating"),
    :schema_element => [
      ["createdBy", "SOAP::SOAPString", [0, 1]],
      ["createdDate", "SOAP::SOAPDateTime", [0, 1]],
      ["lastModifiedBy", "SOAP::SOAPString", [0, 1]],
      ["lastModifiedDate", "SOAP::SOAPDateTime", [0, 1]],
      ["solution", "Client::Model::SqiRating::Solution"],
      ["completeTitle", "SOAP::SOAPInteger"],
      ["adheresToContentStandard", "SOAP::SOAPInteger"],
      ["accuratelyReflectsProblem", "SOAP::SOAPInteger"],
      ["isUnique", "SOAP::SOAPInteger"],
      ["clearAndConcise", "SOAP::SOAPInteger"],
      ["metadataSetCorrectly", "SOAP::SOAPInteger"]
    ]
  )

  Registry.register(
    :class => Client::Model::SqiRating::Solution,
    :schema_name => XSD::QName.new(NsStrata, "solution"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_attribute => {
      XSD::QName.new(nil, "rel") => "SOAP::SOAPString",
      XSD::QName.new(nil, "solutionId") => "SOAP::SOAPString"
    }
  )

  Registry.register(
    :class => Client::Model::Solution,
    :schema_name => XSD::QName.new(NsStrata, "solution"),
    :schema_element => [
      ["createdBy", "SOAP::SOAPString", [0, 1]],
      ["createdDate", "SOAP::SOAPDateTime", [0, 1]],
      ["lastModifiedBy", "SOAP::SOAPString", [0, 1]],
      ["lastModifiedDate", "SOAP::SOAPDateTime", [0, 1]],
      ["id", "SOAP::SOAPString", [0, 1]],
      ["uri", "SOAP::SOAPAnyURI", [0, 1]],
      ["uidName", "SOAP::SOAPString", [0, 1]],
      ["view_uri", "SOAP::SOAPAnyURI", [0, 1]],
      ["title", "SOAP::SOAPString", [0, 1]],
      ["authorSSOName", "SOAP::SOAPString", [0, 1]],
      ["lastModifiedBySSOName", "SOAP::SOAPString", [0, 1]],
      ["language", "SOAP::SOAPString", [0, 1]],
      ["issue", "Client::Model::Solution::Issue", [0, 1]],
      ["environment", "Client::Model::Solution::Environment", [0, 1]],
      ["resolution", "Client::Model::Solution::Resolution", [0, 1]],
      ["rootCause", "Client::Model::Solution::RootCause", [0, 1]],
      ["internalDiagnosticSteps", "Client::Model::Solution::InternalDiagnosticSteps", [0, 1]],
      ["externalDiagnosticSteps", "SOAP::SOAPString", [0, 1]],
      ["summary", "SOAP::SOAPString", [0, 1]],
      ["tags", "SOAP::SOAPString[]", [0, nil]],
      ["v_case", ["SOAP::SOAPAnyURI[]", XSD::QName.new(NsStrata, "case")], [0, nil]],
      ["tag", "Client::Model::Solution::Tag[]", [0, nil]],
      ["published", "SOAP::SOAPBoolean", [0, 1]],
      ["duplicateOf", "Client::Model::Solution::DuplicateOf[]", [0, nil]],
      ["kcsState", "SOAP::SOAPString", [0, 1]],
      ["moderationState", ["SOAP::SOAPString", XSD::QName.new(NsStrata, "ModerationState")], [0, 1]]
    ]
  )

  Registry.register(
    :class => Client::Model::Solution::Issue,
    :schema_name => XSD::QName.new(NsStrata, "issue"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Solution::Environment,
    :schema_name => XSD::QName.new(NsStrata, "environment"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Solution::Resolution,
    :schema_name => XSD::QName.new(NsStrata, "resolution"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Solution::RootCause,
    :schema_name => XSD::QName.new(NsStrata, "rootCause"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Solution::InternalDiagnosticSteps,
    :schema_name => XSD::QName.new(NsStrata, "internalDiagnosticSteps"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Solution::Tag,
    :schema_name => XSD::QName.new(NsStrata, "tag"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Solution::DuplicateOf,
    :schema_name => XSD::QName.new(NsStrata, "duplicateOf"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_attribute => {
      XSD::QName.new(nil, "rel") => "SOAP::SOAPString",
      XSD::QName.new(nil, "solutionId") => "SOAP::SOAPString"
    }
  )

  Registry.register(
    :class => Client::Model::Article,
    :schema_name => XSD::QName.new(NsStrata, "article"),
    :schema_element => [
      ["createdBy", "SOAP::SOAPString", [0, 1]],
      ["createdDate", "SOAP::SOAPDateTime", [0, 1]],
      ["lastModifiedBy", "SOAP::SOAPString", [0, 1]],
      ["lastModifiedDate", "SOAP::SOAPDateTime", [0, 1]],
      ["id", "SOAP::SOAPString", [0, 1]],
      ["uri", "SOAP::SOAPAnyURI", [0, 1]],
      ["uidName", "SOAP::SOAPString", [0, 1]],
      ["view_uri", "SOAP::SOAPAnyURI", [0, 1]],
      ["title", "SOAP::SOAPString", [0, 1]],
      ["authorSSOName", "SOAP::SOAPString", [0, 1]],
      ["lastModifiedBySSOName", "SOAP::SOAPString", [0, 1]],
      ["language", "SOAP::SOAPString", [0, 1]],
      ["issue", "Client::Model::Article::Issue", [0, 1]],
      ["environment", "Client::Model::Article::Environment", [0, 1]],
      ["resolution", "Client::Model::Article::Resolution", [0, 1]],
      ["rootCause", "Client::Model::Article::RootCause", [0, 1]],
      ["internalDiagnosticSteps", "Client::Model::Article::InternalDiagnosticSteps", [0, 1]],
      ["externalDiagnosticSteps", "SOAP::SOAPString", [0, 1]],
      ["summary", "SOAP::SOAPString", [0, 1]],
      ["tags", "SOAP::SOAPString[]", [0, nil]],
      ["v_case", ["SOAP::SOAPAnyURI[]", XSD::QName.new(NsStrata, "case")], [0, nil]],
      ["tag", "Client::Model::Article::Tag[]", [0, nil]],
      ["published", "SOAP::SOAPBoolean", [0, 1]],
      ["duplicateOf", "Client::Model::Article::DuplicateOf[]", [0, nil]],
      ["kcsState", "SOAP::SOAPString", [0, 1]],
      ["body", "SOAP::SOAPString", [0, 1]]
    ]
  )

  Registry.register(
    :class => Client::Model::Article::Issue,
    :schema_name => XSD::QName.new(NsStrata, "issue"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Article::Environment,
    :schema_name => XSD::QName.new(NsStrata, "environment"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Article::Resolution,
    :schema_name => XSD::QName.new(NsStrata, "resolution"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Article::RootCause,
    :schema_name => XSD::QName.new(NsStrata, "rootCause"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Article::InternalDiagnosticSteps,
    :schema_name => XSD::QName.new(NsStrata, "internalDiagnosticSteps"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Article::Tag,
    :schema_name => XSD::QName.new(NsStrata, "tag"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["text", "SOAP::SOAPString"],
      ["html", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Article::DuplicateOf,
    :schema_name => XSD::QName.new(NsStrata, "duplicateOf"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_attribute => {
      XSD::QName.new(nil, "rel") => "SOAP::SOAPString",
      XSD::QName.new(nil, "solutionId") => "SOAP::SOAPString"
    }
  )

  Registry.register(
    :class => Client::Model::Link,
    :schema_name => XSD::QName.new(NsStrata, "link"),
    :schema_element => [
      ["value", "SOAP::SOAPString", [0, 1]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "title") => "SOAP::SOAPString",
      XSD::QName.new(nil, "rel") => "SOAP::SOAPString",
      XSD::QName.new(nil, "href") => "SOAP::SOAPString",
      XSD::QName.new(nil, "type") => "SOAP::SOAPString",
      XSD::QName.new(nil, "uri") => "SOAP::SOAPString",
      XSD::QName.new(nil, "ssoUsername") => "SOAP::SOAPString"
    }
  )

  Registry.register(
    :class => Client::Model::Source,
    :schema_name => XSD::QName.new(NsStrata, "source"),
    :schema_attribute => {
      XSD::QName.new(nil, "name") => "SOAP::SOAPString"
    }
  )

  Registry.register(
    :class => Client::Model::Attachments,
    :schema_name => XSD::QName.new(NsStrata, "attachments"),
    :schema_element => [
      ["attachment", "Client::Model::Attachment[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::Attachment,
    :schema_name => XSD::QName.new(NsStrata, "attachment"),
    :schema_element => [
      ["createdBy", "SOAP::SOAPString", [0, 1]],
      ["createdDate", "SOAP::SOAPDateTime", [0, 1]],
      ["lastModifiedBy", "SOAP::SOAPString", [0, 1]],
      ["lastModifiedDate", "SOAP::SOAPDateTime", [0, 1]],
      ["caseId", "SOAP::SOAPString"],
      ["uuid", "SOAP::SOAPString"],
      ["etag", "SOAP::SOAPString"],
      ["uri", "SOAP::SOAPAnyURI"],
      ["fileDate", "SOAP::SOAPDateTime"],
      ["fileName", "SOAP::SOAPString"],
      ["description", "SOAP::SOAPString"],
      ["mimeType", "SOAP::SOAPString"],
      ["length", "SOAP::SOAPLong"],
      ["active", "SOAP::SOAPBoolean"],
      ["deprecated", "SOAP::SOAPBoolean"],
      ["private", "SOAP::SOAPBoolean", [0, 1]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "caseNumber") => "SOAP::SOAPString"
    }
  )

  Registry.register(
    :class => Client::Model::Suggestions,
    :schema_name => XSD::QName.new(NsStrata, "suggestions"),
    :schema_element => [
      ["suggestion", "Client::Model::Suggestion[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::Suggestion,
    :schema_name => XSD::QName.new(NsStrata, "suggestion"),
    :schema_element => [
      ["createdBy", "SOAP::SOAPString", [0, 1]],
      ["createdDate", "SOAP::SOAPDateTime", [0, 1]],
      ["lastModifiedBy", "SOAP::SOAPString", [0, 1]],
      ["lastModifiedDate", "SOAP::SOAPDateTime", [0, 1]],
      ["algorithmScore", "SOAP::SOAPInt"],
      ["analysisAlgorithm", "SOAP::SOAPString"],
      ["analysisAlgorithmVersion", "SOAP::SOAPString"],
      ["analysisCategory", "SOAP::SOAPString"],
      ["analysisModule", "SOAP::SOAPString"],
      ["analysisService", "SOAP::SOAPString"],
      ["analysisServiceVersion", "SOAP::SOAPString"],
      ["bucket", "SOAP::SOAPString"],
      ["caseNumber", "SOAP::SOAPString"],
      ["client", "SOAP::SOAPString"],
      ["clientVersion", "SOAP::SOAPString"],
      ["display", "SOAP::SOAPBoolean"],
      ["keywords", "SOAP::SOAPString"],
      ["location", "SOAP::SOAPString"],
      ["luceneScore", "SOAP::SOAPInt"],
      ["note", "SOAP::SOAPString"],
      ["relevanceScore", "SOAP::SOAPInt"],
      ["resource", "SOAP::SOAPString"],
      ["rule", "SOAP::SOAPString"],
      ["ruleVersion", "SOAP::SOAPString"],
      ["scoringAlgorithmVersion", "SOAP::SOAPInt"],
      ["solutionId", "SOAP::SOAPString"],
      ["solutionKcsState", "SOAP::SOAPString"],
      ["solutionOwnerSSOName", "SOAP::SOAPString"],
      ["solutionTitle", "SOAP::SOAPString"],
      ["solutionUrl", "SOAP::SOAPString"],
      ["tracebackUrl", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::Groups,
    :schema_name => XSD::QName.new(NsStrata, "groups"),
    :schema_element => [
      ["group", "Client::Model::Group[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::Group,
    :schema_name => XSD::QName.new(NsStrata, "group"),
    :schema_element => [
      ["number", "SOAP::SOAPString"],
      ["name", "SOAP::SOAPString"],
      ["uri", "SOAP::SOAPAnyURI"],
      ["isPrivate", "SOAP::SOAPBoolean", [0, 1]]
    ]
  )

  Registry.register(
    :class => Client::Model::Account,
    :schema_name => XSD::QName.new(NsStrata, "account"),
    :schema_element => [
      ["hasGroupACLs", "SOAP::SOAPBoolean", [0, 1]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "number") => "SOAP::SOAPString"
    }
  )

  Registry.register(
    :class => Client::Model::Users,
    :schema_name => XSD::QName.new(NsStrata, "users"),
    :schema_element => [
      ["user", "Client::Model::User[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::User,
    :schema_name => XSD::QName.new(NsStrata, "user"),
    :schema_element => [
      ["id", "SOAP::SOAPString"],
      ["firstName", "SOAP::SOAPString"],
      ["lastName", "SOAP::SOAPString"],
      ["email", "SOAP::SOAPString", [0, 1]],
      ["accountId", "SOAP::SOAPAnyURI", [0, 1]],
      ["preferredLanguage", "SOAP::SOAPString", [0, 1]],
      ["title", "SOAP::SOAPString", [0, 1]],
      ["timezone", "SOAP::SOAPString", [0, 1]],
      ["orgAdmin", "SOAP::SOAPBoolean", [0, 1]],
      ["tamContact", "SOAP::SOAPBoolean", [0, 1]],
      ["access", "SOAP::SOAPBoolean", [0, 1]],
      ["hasChat", "SOAP::SOAPBoolean", [0, 1]],
      ["sessionId", "SOAP::SOAPString", [0, 1]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "ssoUsername") => "SOAP::SOAPString",
      XSD::QName.new(nil, "uri") => "SOAP::SOAPAnyURI"
    }
  )

  Registry.register(
    :class => Client::Model::Cases,
    :schema_name => XSD::QName.new(NsStrata, "cases"),
    :schema_element => [
      ["v_case", ["Client::Model::Case[]", XSD::QName.new(NsStrata, "case")], [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::Case,
    :schema_name => XSD::QName.new(NsStrata, "case"),
    :schema_element => [
      ["createdBy", "SOAP::SOAPString", [0, 1]],
      ["createdDate", "SOAP::SOAPDateTime", [0, 1]],
      ["lastModifiedBy", "SOAP::SOAPString", [0, 1]],
      ["lastModifiedDate", "SOAP::SOAPDateTime", [0, 1]],
      ["id", "SOAP::SOAPString", [0, 1]],
      ["uri", "SOAP::SOAPAnyURI", [0, 1]],
      ["summary", "SOAP::SOAPString", [0, 1]],
      ["description", "SOAP::SOAPString", [0, 1]],
      ["status", "SOAP::SOAPString", [0, 1]],
      ["product", "SOAP::SOAPString", [0, 1]],
      ["component", "SOAP::SOAPString", [0, 1]],
      ["version", "SOAP::SOAPString", [0, 1]],
      ["type", "SOAP::SOAPString", [0, 1]],
      ["accountNumber", "SOAP::SOAPString", [0, 1]],
      ["reference", "SOAP::SOAPString", [0, 1]],
      ["notes", "SOAP::SOAPString", [0, 1]],
      ["escalated", "SOAP::SOAPBoolean", [0, 1]],
      ["contactName", "SOAP::SOAPString", [0, 1]],
      ["contactSsoUsername", "SOAP::SOAPString", [0, 1]],
      ["origin", "SOAP::SOAPString", [0, 1]],
      ["owner", "SOAP::SOAPString", [0, 1]],
      ["internalPriority", "SOAP::SOAPString", [0, 1]],
      ["internalStatus", "SOAP::SOAPString", [0, 1]],
      ["suppliedName", "SOAP::SOAPString", [0, 1]],
      ["suppliedPhone", "SOAP::SOAPString", [0, 1]],
      ["suppliedEmail", "SOAP::SOAPString", [0, 1]],
      ["severity", "SOAP::SOAPString", [0, 1]],
      ["folderNumber", "SOAP::SOAPString", [0, 1]],
      ["comments", "Client::Model::Comments", [0, 1]],
      ["notified_users", "Client::Model::Notified_users", [0, 1]],
      ["entitlement", "Client::Model::Entitlement"],
      ["solutions", "Client::Model::Solutions"]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "caseNumber") => "SOAP::SOAPString",
      XSD::QName.new(nil, "closed") => "SOAP::SOAPBoolean",
      XSD::QName.new(nil, "alternateId") => "SOAP::SOAPString"
    }
  )

  Registry.register(
    :class => Client::Model::Comments,
    :schema_name => XSD::QName.new(NsStrata, "comments"),
    :schema_element => [
      ["comment", "Client::Model::Comment[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::Comment,
    :schema_name => XSD::QName.new(NsStrata, "comment"),
    :schema_element => [
      ["createdBy", "SOAP::SOAPString", [0, 1]],
      ["createdDate", "SOAP::SOAPDateTime", [0, 1]],
      ["lastModifiedBy", "SOAP::SOAPString", [0, 1]],
      ["lastModifiedDate", "SOAP::SOAPDateTime", [0, 1]],
      ["text", "SOAP::SOAPString", [0, 1]],
      ["uri", "SOAP::SOAPAnyURI", [0, 1]],
      ["public", "SOAP::SOAPBoolean", [0, 1]],
      ["draft", "SOAP::SOAPBoolean", [0, 1]],
      ["publishedDate", "SOAP::SOAPDateTime", [0, 1]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "id") => "SOAP::SOAPString",
      XSD::QName.new(nil, "caseNumber") => "SOAP::SOAPString"
    }
  )

  Registry.register(
    :class => Client::Model::Notified_users,
    :schema_name => XSD::QName.new(NsStrata, "notified_users"),
    :schema_element => [
      ["link", "Client::Model::Link[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::Products,
    :schema_name => XSD::QName.new(NsStrata, "products"),
    :schema_element => [
      ["product", "Client::Model::Product[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::Product,
    :schema_name => XSD::QName.new(NsStrata, "product"),
    :schema_element => [
      ["code", "SOAP::SOAPString", [0, 1]],
      ["name", "SOAP::SOAPString", [0, 1]]
    ]
  )

  Registry.register(
    :class => Client::Model::Versions,
    :schema_name => XSD::QName.new(NsStrata, "versions"),
    :schema_element => [
      ["version", "SOAP::SOAPString[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::Values,
    :schema_name => XSD::QName.new(NsStrata, "values"),
    :schema_element => [
      ["value", "Client::Model::Values::Value[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::Values::Value,
    :schema_name => XSD::QName.new(NsStrata, "value"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["name", "SOAP::SOAPString"],
      ["value", "SOAP::SOAPString", [0, 1]]
    ],
    :schema_attribute => {
      XSD::QName.new(nil, "type") => "SOAP::SOAPString"
    }
  )

  Registry.register(
    :class => Client::Model::Entitlements,
    :schema_name => XSD::QName.new(NsStrata, "entitlements"),
    :schema_element => [
      ["entitlement", "Client::Model::Entitlement[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::Entitlement,
    :schema_name => XSD::QName.new(NsStrata, "entitlement"),
    :schema_element => [
      ["createdBy", "SOAP::SOAPString", [0, 1]],
      ["createdDate", "SOAP::SOAPDateTime", [0, 1]],
      ["lastModifiedBy", "SOAP::SOAPString", [0, 1]],
      ["lastModifiedDate", "SOAP::SOAPDateTime", [0, 1]],
      ["id", "SOAP::SOAPString", [0, 1]],
      ["uri", "SOAP::SOAPAnyURI", [0, 1]],
      ["name", "SOAP::SOAPString"],
      ["sla", "SOAP::SOAPString", [0, 1]],
      ["supportLevel", "SOAP::SOAPString", [0, 1]],
      ["serviceLevel", "SOAP::SOAPString", [0, 1]],
      ["startDate", "SOAP::SOAPDate"],
      ["endDate", "SOAP::SOAPDate"]
    ]
  )

  Registry.register(
    :class => Client::Model::Error,
    :schema_name => XSD::QName.new(NsStrata, "error"),
    :schema_element => [
      ["code", "SOAP::SOAPString"],
      ["message", "SOAP::SOAPString"]
    ]
  )

  Registry.register(
    :class => Client::Model::SystemProfiles,
    :schema_name => XSD::QName.new(NsStrata, "systemProfiles"),
    :schema_element => [
      ["systemProfile", "Client::Model::SystemProfile[]", [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::SystemProfile,
    :schema_name => XSD::QName.new(NsStrata, "systemProfile"),
    :schema_element => [
      ["createdBy", "SOAP::SOAPString", [0, 1]],
      ["createdDate", "SOAP::SOAPDateTime", [0, 1]],
      ["lastModifiedBy", "SOAP::SOAPString", [0, 1]],
      ["lastModifiedDate", "SOAP::SOAPDateTime", [0, 1]],
      ["accountNumber", "SOAP::SOAPString", [0, 1]],
      ["caseNumber", "SOAP::SOAPString", [0, 1]],
      ["attachmentHash", "SOAP::SOAPString", [0, 1]],
      ["deprecated", "SOAP::SOAPBoolean", [0, 1]],
      ["hash", "SOAP::SOAPString", [0, 1]],
      ["systemProfileCategory", ["Client::Model::SystemProfileCategory[]", XSD::QName.new(NsStrata, "SystemProfileCategory")], [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::SystemProfileCategory,
    :schema_name => XSD::QName.new(NsStrata, "SystemProfileCategory"),
    :schema_element => [
      ["systemProfileCategoryName", ["SOAP::SOAPString", XSD::QName.new(NsStrata, "SystemProfileCategoryName")], [0, 1]],
      ["systemProfileCategoryDetails", ["Client::Model::SystemProfileCategoryDetails[]", XSD::QName.new(NsStrata, "SystemProfileCategoryDetails")], [0, nil]]
    ]
  )

  Registry.register(
    :class => Client::Model::SystemProfileCategoryDetails,
    :schema_name => XSD::QName.new(NsStrata, "SystemProfileCategoryDetails"),
    :schema_element => [
      ["key", "SOAP::SOAPString", [0, 1]],
      ["value", "SOAP::SOAPString", [0, 1]]
    ]
  )
end

end; end
